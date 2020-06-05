#include <SPI.h>
#include <Wire.h>
#include "RTClib.h"

// UI times
#define TEST_PATTERN_TRIGGER_DELAY 2000UL // Time to triggger test pattern, ms
#define TEST_PATTERN_DELAY 250UL // Time to display each frame in test pattern, ms
#define MAIN_LOOP_DELAY 20UL // Main loop time, ms
#define TIME_SET_FAST_DELAY 500UL // Time before time starts incrementing/decrementing rapidly, ms

// UI states
uint32_t time_fwd_time_pressed = 0;
uint32_t time_fwd_last_state = 0;

uint32_t time_rev_time_pressed = 0;
uint32_t time_rev_last_state = 0;

// Signal assignments from control PCB
#define DISPLAY_CLOCK_N PB3
#define DISPLAY_DATA_N PB5
#define SPI_MISO_DUMMY PB4
#define BOOST_EN_N PC13
#define LED_DEBUG_N PC14
#define TIME_FWD_N PA4
#define TIME_REV_N PA3
#define I2C_SDA PB11
#define I2C_SCL PB10

// Signal Assignments from display PCB
const uint8_t tube1[] = {31-20, 31-19, 31-21};
const uint8_t tube2[] = {31-23, 31-22, 31-25, 31-26, 31-31, 31-30, 31-29, 31-28, 31-27, 31-24};
const uint8_t tube3[] = {31-13, 31-11, 31-10, 31-6, 31-1, 31-0};
const uint8_t tube4[] = {31-2, 31-16, 31-15, 31-14, 31-9, 31-8, 31-7, 31-5, 31-4, 31-3};

#define DISPLAY_LEFT_COMMA (1<<(31-18))
#define DISPLAY_RIGHT_COMMA (1<<(31-12))
#define DISPLAY_NO_COMMA 0

// DS3231 instance
RTC_DS3231 rtc_ds3231;

void setup() {

  // Initialize GPIOs
  digitalWrite(BOOST_EN_N, HIGH);
  pinMode(BOOST_EN_N, OUTPUT);
  
  digitalWrite(DISPLAY_CLOCK_N, HIGH);
  digitalWrite(DISPLAY_DATA_N, HIGH);
  pinMode(DISPLAY_CLOCK_N, OUTPUT);
  pinMode(DISPLAY_DATA_N, OUTPUT);

  pinMode(TIME_FWD_N, INPUT_PULLUP);
  pinMode(TIME_REV_N, INPUT_PULLUP);

  digitalWrite(LED_DEBUG_N, HIGH);
  pinMode(LED_DEBUG_N, OUTPUT);

  // Need to initalize SPI first so we can continuously turn off
  // the display while the boost converter starts up.
  SPI = SPIClass(DISPLAY_DATA_N, SPI_MISO_DUMMY, DISPLAY_CLOCK_N);
  SPI.begin();
  SPI.beginTransaction(SPISettings(1E6,LSBFIRST,SPI_MODE0));

  // Turning the boost converter on seems to put garbage in the 
  // shift register, so continuously write (inverted) zeros to it.
  digitalWrite(LED_DEBUG_N, LOW);
  unsigned long tStart = millis();
  SPI.transfer16(0xFFFF);
  SPI.transfer16(0xFFFF);
  digitalWrite(BOOST_EN_N, LOW); // Enable the boost converter
  while(millis()-tStart < 200)
  {
    SPI.transfer16(0xFFFF);
    SPI.transfer16(0xFFFF);
  }
  digitalWrite(LED_DEBUG_N, HIGH);

  // Start I2C on alternate pins *before* starting the DS3231 RTC
  Wire.setSDA(I2C_SDA);
  Wire.setSCL(I2C_SCL);
  Wire.begin();

  // Start the DS3231 RTC
  if (!rtc_ds3231.begin())
  {
    error_handler(1);
  }
}

void loop() 
{
  // Record start time of the main loop
  unsigned long loop_start = millis();

  // Poll the current state of the buttons
  uint32_t time_fwd_current_state = !digitalRead(TIME_FWD_N);
  uint32_t time_rev_current_state = !digitalRead(TIME_REV_N);


  // If button was just pressed, increment/decrement the time
  if(time_fwd_current_state && !time_fwd_last_state)
  {
    increment_time();
  }
  // If button is being held...
  if(time_fwd_current_state && time_fwd_last_state)
  {
    // Keep track of how long the button has been pressed, 
    // while preventing any odd behavior from overflow
    if (time_fwd_time_pressed <= TIME_SET_FAST_DELAY+TEST_PATTERN_TRIGGER_DELAY)
    {
      time_fwd_time_pressed += MAIN_LOOP_DELAY;
    }

    // If the button has been pressed for longer than TIME_SET_FAST_DELAY, 
    // start incrementing/decrementing time on every iteration of this loop
    if (time_fwd_time_pressed >= TIME_SET_FAST_DELAY)
    {
      increment_time();
    }
  }
  // If not currently pressed, reset time pressed to zero
  if(!time_fwd_current_state)
  {
    time_fwd_time_pressed = 0;
  }


  // If button was just pressed, increment/decrement the time
  if(time_rev_current_state && !time_rev_last_state)
  {
    decrement_time();
  }
  // If button is being held...
  if(time_rev_current_state && time_rev_last_state)
  {
    // Keep track of how long the button has been pressed, 
    // while preventing any odd behavior from overflow
    if (time_rev_time_pressed <= TIME_SET_FAST_DELAY+TEST_PATTERN_TRIGGER_DELAY)
    {
      time_rev_time_pressed += MAIN_LOOP_DELAY;
    }

    // If the button has been pressed for longer than TIME_SET_FAST_DELAY, 
    // start incrementing/decrementing time on every iteration of this loop
    if (time_rev_time_pressed >= TIME_SET_FAST_DELAY)
    {
      decrement_time();
    }
  }
  // If not currently pressed, reset time pressed to zero
  if(!time_rev_current_state)
  {
    time_rev_time_pressed = 0;
  }

  // If both buttons have been pressed for longer than TEST_PATTERN_TRIGGER_DELAY,
  // show the test pattern
  if((time_rev_time_pressed >= TEST_PATTERN_TRIGGER_DELAY) && (time_fwd_time_pressed >= TEST_PATTERN_TRIGGER_DELAY))
  {
    show_test_pattern(TEST_PATTERN_DELAY);
  }


  // Update the display
  DateTime now = rtc_ds3231.now();
  updateDisplay(now.hour(),now.minute(),0);


  // Save the last state of the buttons
  time_fwd_last_state = time_fwd_current_state;
  time_rev_last_state = time_rev_current_state;

  // Delay for the rest of the MAIN_LOOP_DELAY, if any.
  // If millis was about to overflow, loop_start+MAIN_LOOP_DELAY will be a small number, 
  // thus immediately triggering without the proper delay, which won't cause it to lock up.
  // If loop_start + MAIN_LOOP_DELAY is max unsigned long, "<" should still cause the loop 
  // to continue. I'm pretty sure this won't lock up even under overflow conditions.
  while(millis() < (loop_start + MAIN_LOOP_DELAY))
  {
    ;
  }
}

void increment_time()
{
  // Get the time from the DS3231 RTC
  DateTime now = rtc_ds3231.now();
  uint32_t current_hour = now.hour();
  uint32_t current_minute = now.minute();

  // Increment the time
  if(current_minute == 59)
    {
      if(current_hour == 23)
      {
        current_hour = 0;
        current_minute = 0;
      }
      else
      {
        current_hour++;
        current_minute = 0;
      }
    }
    else
    {
      current_minute++;
    }
    
  // Write the incremented time back to the DS3231 RTC
  rtc_ds3231.adjust(DateTime(2000, 1, 1, current_hour, current_minute, 0));
}

void decrement_time()
{
  // Get the time from the DS3231 RTC
  DateTime now = rtc_ds3231.now();
  uint32_t current_hour = now.hour();
  uint32_t current_minute = now.minute();

  // Decrement the time
  if(current_minute == 0)
  {
    if(current_hour == 0)
    {
      current_hour = 23;
      current_minute = 59;
    }
    else
    {
      current_hour--;
      current_minute = 59;
    }
  }
  else
  {
    current_minute--;
  }

  // Write the decremented time back to the DS3231 RTC
  rtc_ds3231.adjust(DateTime(2000, 1, 1, current_hour, current_minute, 0));
}


// Sends 32 bit buffer to the display
void send_display_buffer(uint32_t tx_buf)
{
  SPI.transfer16((uint16_t) tx_buf);
  SPI.transfer16((uint16_t) (tx_buf>>16));
}


void updateDisplay(uint32_t hour, uint32_t minute, uint32_t mode24hr)
{
  uint32_t tx_buf = 0;

  // 24 hour mode is easy
  if (mode24hr)
  {
    tx_buf = ~((1<<tube1[hour/10])|(1<<tube2[hour%10])|(1<<tube3[minute/10])|(1<<tube4[minute%10]));
  }
  else
  {
    // AM/PM is super awkward. Maybe there's a cleaner way to do this.
    if (hour == 0)
    {
      tx_buf = ~((1<<tube1[1])|(1<<tube2[2])|(1<<tube3[minute/10])|(1<<tube4[minute%10]));
    }
    else if (hour == 12)
    {
      tx_buf = ~((1<<tube1[1])|(1<<tube2[2])|(1<<tube3[minute/10])|(1<<tube4[minute%10])|DISPLAY_LEFT_COMMA);
    }
    else if (hour > 12)
    {
      if((hour-12)/10 == 0)
      {
        tx_buf = ~((1<<tube2[(hour-12)%10])|(1<<tube3[minute/10])|(1<<tube4[minute%10])|DISPLAY_LEFT_COMMA);
      }
      else
      {
        tx_buf = ~((1<<tube1[(hour-12)/10])|(1<<tube2[(hour-12)%10])|(1<<tube3[minute/10])|(1<<tube4[minute%10])|DISPLAY_LEFT_COMMA);
      }
    }
    else
    {
      if (hour/10 == 0)
      {
        tx_buf = ~((1<<tube2[hour%10])|(1<<tube3[minute/10])|(1<<tube4[minute%10]));
      }
      else
      {
        tx_buf = ~((1<<tube1[hour/10])|(1<<tube2[hour%10])|(1<<tube3[minute/10])|(1<<tube4[minute%10]));
      }
    }
  }
  
  send_display_buffer(tx_buf);
}


void show_test_pattern(uint32_t test_pattern_delay)
{
  for(uint32_t digit = 0; digit <= 2; digit++)
    {
      uint32_t tx_buf = ~((1<<tube1[digit])|(1<<tube2[0])|(1<<tube3[0])|(1<<tube4[0]));
      send_display_buffer(tx_buf);
      delay(test_pattern_delay);
    }
    for(uint32_t digit = 0; digit <= 9; digit++)
    {
      uint32_t tx_buf = ~((1<<tube1[0])|(1<<tube2[digit])|(1<<tube3[0])|(1<<tube4[0]));
      send_display_buffer(tx_buf);
      delay(test_pattern_delay);
    }
    for(uint32_t digit = 0; digit <= 5; digit++)
    {
      uint32_t tx_buf = ~((1<<tube1[0])|(1<<tube2[0])|(1<<tube3[digit])|(1<<tube4[0]));
      send_display_buffer(tx_buf);
      delay(test_pattern_delay);
    }
    for(uint32_t digit = 0; digit <= 9; digit++)
    {
      uint32_t tx_buf = ~((1<<tube1[0])|(1<<tube2[0])|(1<<tube3[0])|(1<<tube4[digit]));
      send_display_buffer(tx_buf);
      delay(test_pattern_delay);
    }

    uint32_t disp0000_left_comma = ~((1<<tube1[0])|(1<<tube2[0])|(1<<tube3[0])|(1<<tube4[0])|DISPLAY_LEFT_COMMA);
    send_display_buffer(disp0000_left_comma);
    delay(test_pattern_delay);

    uint32_t disp0000_right_comma = ~((1<<tube1[0])|(1<<tube2[0])|(1<<tube3[0])|(1<<tube4[0])|DISPLAY_RIGHT_COMMA);
    send_display_buffer(disp0000_right_comma);
    delay(test_pattern_delay);
}

void error_handler(uint32_t n)
{
  digitalWrite(LED_DEBUG_N, HIGH);
  while(1)
  {
    for(uint32_t i = 0; i < n; i++)
    {
      digitalWrite(LED_DEBUG_N, LOW);
      delay(75);
      digitalWrite(LED_DEBUG_N, HIGH);
      delay(75);
    }
    delay(1000);
  }
}

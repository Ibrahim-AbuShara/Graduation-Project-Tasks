#include <Arduino.h>
#include <DHTesp.h>
#include <Ticker.h>
#include <SPI.h>
#include <WiFi.h>
#include "WiFiClient.h"
#include <SimpleTimer.h>
WiFiClient client;
#define DHTPIN 4         // Digital pin 4
//int dhtPin =4
#define DHTTYPE DHT22    // DHT 22
DHTesp dhtsnsor1;

//SimpleTimer timer;
char ssid[] = "ORAHA";       //Enter your WIFI Name
char pass[] = "AAssDDff";  //Enter your WIFI Password
const uint16_t port = 5050;
const char * host = "192.168.1.6";
String  temp;
String  hum;

void tempTask(void *pvParameters);
bool getTemperature();
void triggerGetTemp();

/** Task handle for the light value read task */
TaskHandle_t tempTaskHandle = NULL;
/** Ticker for temperature reading */
Ticker tempTicker;
/** Comfort profile */
ComfortState cf;
/** Flag if task should run */
bool tasksEnabled = false;


bool initTemp() {
  //byte resultValue = 0;
  // Initialize temperature sensor
  dhtsnsor1.setup(DHTPIN, DHTesp::DHT11);
   Serial.println("DHT initiated");
// Start task to get temperature
  xTaskCreatePinnedToCore(tempTask,"tempTask ", 4000,NULL,5,&tempTaskHandle, 1);                          
  if (tempTaskHandle == NULL) {
    Serial.println("Failed to start task for temperature update");
    return false;
  } else {
    // Start update of environment data every 20 seconds
    tempTicker.attach(20, triggerGetTemp);
  }
  return true;                                                
}
void triggerGetTemp() {
  if (tempTaskHandle != NULL) {
     xTaskResumeFromISR(tempTaskHandle);
  }}
  void tempTask(void *pvParameters){
  Serial.println("tempTask loop started");
  while (1) // tempTask loop
  {
    if (tasksEnabled) {
      // Get temperature values
      getTemperature();
    }
    // Got sleep again
    vTaskSuspend(NULL);
  }
}
bool getTemperature() {
  // Reading temperature for humidity takes about 250 milliseconds!
  TempAndHumidity newValues = dhtsnsor1.getTempAndHumidity();
  // Check if any reads failed and exit early (to try again).
  if (dhtsnsor1.getStatus() != 0) {
    Serial.println("DHT11 error status: " + String(dhtsnsor1.getStatusString()));
    return false;
  }
  
  float heatIndex = dhtsnsor1.computeHeatIndex(newValues.temperature, newValues.humidity);
  float dewPoint = dhtsnsor1.computeDewPoint(newValues.temperature, newValues.humidity);
  //float cr = dhtsnsor1.getComfortRatio(cf, newValues.temperature, newValues.humidity);

  temp=String (newValues.temperature);
  hum=String (newValues.humidity);
  Serial.println(" T:" + String(newValues.temperature) + " H:" + String(newValues.humidity) + " I:" + String(heatIndex) + " D:" + String(dewPoint) + " ");
  client.println( temp );
  return true;
  /*client.println(" T:" + String(newValues.temperature) + " H:" + String(newValues.humidity) + " I:" + String(heatIndex) + " D:" + String(dewPoint) + " " + comfortStatus);
  return true;*/
}


void setup(){
 
  Serial.begin(9600);
  WiFi.begin(ssid, pass);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    client.println("...");
  }
  Serial.print("WiFi connected with IP: ");
  Serial.println(WiFi.localIP());
 
}
 
void loop()
{
  if (!client.connect(host, port)) {
 
        client.println("Connection to host failed");
 
        delay(1000);
        return;
  }
 
  Serial.println("Connected to server successful!");
  Serial.print("Hello from ESP32!");
  initTemp();
   

  tasksEnabled = true;
  if (!tasksEnabled) {
    // Wait 2 seconds to let system settle down
    delay(500);
    // Enable task that will read values from the DHT sensor
    tasksEnabled = true;
    if (tempTaskHandle != NULL) {
      vTaskResume(tempTaskHandle);
    }}
  yield(); 

  //client.println("Disconnecting...");
  client.stop();
 
  delay(10000);
  
}

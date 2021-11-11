#include <Arduino.h>
#include <DHTesp.h>
#include <Ticker.h>
#include <SPI.h>
#include <WiFi.h>
#include "WiFiClient.h"
#include <SimpleTimer.h>
WiFiClient client;
#define DHTPIN 2         // Digital pin 4
//int dhtPin =4
#define DHTTYPE DHT22    // DHT 22
DHTesp dhtsnsor1;

//SimpleTimer timer;
char ssid[] = "ORAHA";       //Enter your WIFI Name
char pass[] = "AAssDDff";  //Enter your WIFI Password
const uint16_t port = 5050;
const char * host = "192.168.1.4";

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
  byte resultValue = 0;
  // Initialize temperature sensor
	dhtsnsor1.setup(DHTPIN, DHTesp::DHT22);
	 client.println("DHT initiated");
  Serial.println("DHT initiated");
// Start task to get temperature
	xTaskCreatePinnedToCore(tempTask,"tempTask ", 4000,NULL,5,&tempTaskHandle, 1);                          
	if (tempTaskHandle == NULL) {
    client.println("Failed to start task for temperature update");
    return false;
  } else {
    // Start update of environment data every 20 seconds
    tempTicker.attach(2, triggerGetTemp);
  }
  return true;	                              			          
}
void triggerGetTemp() {
  if (tempTaskHandle != NULL) {
	   xTaskResumeFromISR(tempTaskHandle);
  }}
  void tempTask(void *pvParameters){
	client.println("tempTask loop started");
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
		client.println("DHT11 error status: " + String(dhtsnsor1.getStatusString()));
    Serial.println("DHT11 error status: " + String(dhtsnsor1.getStatusString()));
		return false;
	}
  
	float heatIndex = dhtsnsor1.computeHeatIndex(newValues.temperature, newValues.humidity);
  float dewPoint = dhtsnsor1.computeDewPoint(newValues.temperature, newValues.humidity);
  //float cr = dhtsnsor1.getComfortRatio(cf, newValues.temperature, newValues.humidity);

  String comfortStatus;
  switch(cf) {
    case Comfort_OK:
      comfortStatus = "Comfort_OK";
      break;
    case Comfort_TooHot:
      comfortStatus = "Comfort_TooHot";
      break;
    case Comfort_TooCold:
      comfortStatus = "Comfort_TooCold";
      break;
    case Comfort_TooDry:
      comfortStatus = "Comfort_TooDry";
      break;
    case Comfort_TooHumid:
      comfortStatus = "Comfort_TooHumid";
      break;
    case Comfort_HotAndHumid:
      comfortStatus = "Comfort_HotAndHumid";
      break;
    case Comfort_HotAndDry:
      comfortStatus = "Comfort_HotAndDry";
      break;
    case Comfort_ColdAndHumid:
      comfortStatus = "Comfort_ColdAndHumid";
      break;
    case Comfort_ColdAndDry:
      comfortStatus = "Comfort_ColdAndDry";
      break;
    default:
      comfortStatus = "Unknown:";
      break;
  };
  client.print( String(newValues.temperature) );
  Serial.println(" T:" + String(newValues.temperature) + " H:" + String(newValues.humidity) + " I:" + String(heatIndex) + " D:" + String(dewPoint) + " " + comfortStatus);
	return true;
}


void setup(){
 
  Serial.begin(9600);
  WiFi.begin(ssid, pass);
  while (WiFi.status() != WL_CONNECTED) {
    
    client.println("...");
  }
  client.print("WiFi connected with IP: ");
  client.println(WiFi.localIP());
  
  if (!client.connect(host, port)) {
 
        Serial.println("Connection to host failed");
 
        delay(500);
        return;
  }
 
  client.println("Connected to server successful!");
  Serial.println("Connected to server successful!");
  client.print("Hello from ESP32!");
  Serial.print("Hello from ESP32!");
  initTemp();

  // Signal end of setup() to tasks
  tasksEnabled = true;

   
 
  if (!tasksEnabled) {
    // Wait 2 seconds to let system settle down
    delay(1000);
    // Enable task that will read values from the DHT sensor
    tasksEnabled = true;
    if (tempTaskHandle != NULL) {
			vTaskResume(tempTaskHandle);
		}
  }
  yield(); 

  
  client.println("READING...");
  
 

  
   
 
}
 
void loop()
{
}

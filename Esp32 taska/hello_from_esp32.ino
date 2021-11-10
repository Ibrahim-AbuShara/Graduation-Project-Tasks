#include <WiFi.h>
 
const char* ssid = "ORAHA";
const char* password =  "AAssDDff";
 
const uint16_t port = 5050;
const char * host = "192.168.1.4";
 
void setup()
{
 
  Serial.begin(115200);
 
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.println("...");
  }
 
  Serial.print("WiFi connected with IP: ");
  Serial.println(WiFi.localIP());
 
}
 
void loop()
{
    WiFiClient client;
 
    if (!client.connect(host, port)) {
 
        Serial.println("Connection to host failed");
 
        delay(1000);
        return;
    }
 
    Serial.println("Connected to server successful!");
 
    client.print("Hello from ESP32!");
    delay(5000);
    client.println("KILL");
    delay(5000);
 
    
}

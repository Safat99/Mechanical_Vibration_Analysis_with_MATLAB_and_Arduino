const int xInput = A3;
const int yInput = A4;
const int zInput = A5;

// initialize minimum and maximum Raw Ranges for each axis
int RawMin = 0;
int RawMax = 1023;

// Take multiple samples to reduce noise
const int sampleSize = 10;

void setup() 
{
  analogReference(EXTERNAL);
  Serial.begin(115200);
}

int flag = 1000;
void loop() 
{
  if(flag){
    //Read raw values
    float xRaw = ReadAxis(xInput);
    float yRaw = ReadAxis(yInput);
    float zRaw = ReadAxis(zInput);
  
    // Convert raw values to 'milli-Gs"
    long xScaled = map(xRaw, RawMin, RawMax, -3000, 3000);
    long yScaled = map(yRaw, RawMin, RawMax, -3000, 3000);
    long zScaled = map(zRaw, RawMin, RawMax, -3000, 3000);
  
    // re-scale to fractional Gs
    float xAccel = xScaled / 1000.0;
    float yAccel = yScaled / 1000.0;
    float zAccel = zScaled / 1000.0;
  
  //  Serial.print("X, Y, Z  :: ");

//      Serial.print(xRaw);
//      Serial.print("\t");
//      Serial.print(yRaw);
//      Serial.print("\t");
//      Serial.println(zRaw);
  
    
    Serial.print(millis());
    Serial.print(", ");
    
    Serial.print(xRaw);
    Serial.print(", ");
    Serial.print(yRaw);
    Serial.print(", ");
    Serial.println(zRaw);
  //  Serial.print(" :: ");
  //  Serial.print(xAccel);
  //  Serial.print("G, ");
  //  Serial.print(yAccel);
  //  Serial.print("G, ");
  //  Serial.print(zAccel);
  //  Serial.println("G");
    //delay(1);
    flag--;
  }
}

// Take samples and return the average
float ReadAxis(int axisPin)
{
  long reading = 0;
  analogRead(axisPin);
  delay(1);
  for (int i = 0; i < sampleSize; i++)
  {
  reading += analogRead(axisPin);
  }
  return reading/sampleSize;
}

# Literature Review Collection Guide  
## Role 2: Smart Helmet and Wearable Rider Safety Systems

## 1. Purpose of This Role

This category focuses on smart helmets and wearable safety devices designed for two-wheeler riders. These systems typically integrate sensors, communication modules, and sometimes navigation or alert mechanisms.

This section supports the wearable and helmet-centric aspects of the proposed system.

The goal is to:
- Understand how existing smart helmets are designed
- Analyze sensing modalities and communication dependencies
- Identify architectural limitations
- Highlight gaps in decentralization, multimodal fusion, and hybrid operation

---

## 2. What Needs to Be Collected from Each Paper

For every selected reference, extract the following:

### A. Sensor Configuration
- Does it include IMU (accelerometer, gyroscope)?
- Alcohol sensor?
- Impact sensor?
- GPS?
- Camera-based detection?
- Physiological monitoring?
- Proximity sensors?

### B. Detection Capabilities
- Crash detection only?
- Drowsiness detection?
- Helmet-wearing detection?
- Speed monitoring?
- Voice interaction?

### C. Communication Model
- GSM-based SMS alert?
- Bluetooth to phone?
- Cloud-dependent?
- Requires internet connectivity?
- Real-time or delayed reporting?

### D. Intelligence Placement
- Is AI running on microcontroller?
- Is processing done on the phone?
- Is processing cloud-based?
- Is there deterministic safety logic?

### E. Alert Mechanisms
- SMS to emergency contacts?
- App notification?
- Cloud dashboard?
- Automatic calling feature?

### F. Operational Limitations
- Does it fail without internet?
- Does it depend entirely on the phone?
- Does it lack peer-to-peer capability?
- Does it support group coordination?

---

## 3. Expected Gaps to Look For

When reviewing literature, focus on identifying:

- Single-rider isolated systems
- GSM-only emergency alerts
- Cloud-dependent crash detection
- Lack of decentralized communication
- No mesh or peer-to-peer functionality
- Limited or no fatigue detection
- No multimodal fusion (blink + IMU + voice)
- No hybrid online–offline switching
- No deterministic execution independent of mobile OS

These gaps will support the novelty of your distributed helmet-centric system.

---

## 4. Keywords for Research Paper Platforms  
(IEEE, Springer, ACM, ScienceDirect, Google Scholar)

Primary Keywords:
- Smart helmet for two wheeler safety
- IoT based smart helmet system
- Helmet crash detection system
- Intelligent helmet accident detection
- Wearable rider safety system
- Motorcycle safety helmet with sensors
- Bluetooth helmet emergency system
- GSM based helmet alert system
- Smart helmet navigation system

Secondary Modifiers:
- crash detection algorithm
- fatigue detection rider
- IMU based accident detection
- helmet mounted safety system
- embedded system for helmet
- real time emergency alert
- IoT safety wearable

Example Combined Queries:
- "IoT based smart helmet accident detection system"
- "Motorcycle smart helmet GSM emergency alert"
- "Helmet based fatigue detection using IMU"
- "Wearable rider safety system with GPS and GSM"

---

## 5. Keywords for Patent Search Platforms  
(Google Patents, WIPO, Espacenet, USPTO)

Patent searches require functional descriptions.

Set A – Core Helmet System
- Intelligent safety helmet apparatus
- Smart helmet accident detection system
- Motorcycle safety wearable device
- Helmet with emergency alert transmitter
- Rider protection helmet with sensors

Set B – Communication and Alert Features
- Helmet based distress signaling device
- Automatic crash notification helmet
- Wearable accident alert apparatus
- Helmet emergency communication module
- Bluetooth connected helmet safety device

Set C – Advanced Functional Claims
- Helmet with fatigue detection system
- Multisensor safety helmet apparatus
- Helmet with physiological monitoring
- Wearable device with crash classification logic
- Rider safety coordination system

Use claim-style terms such as:
- apparatus
- system
- method
- wearable unit
- sensor module
- communication interface

---

## 6. IEEE Xplore AI Search Prompt

You may paste the following into IEEE Xplore AI search:

Prompt:

"I am conducting a literature review on smart helmet systems for two-wheeler rider safety. Please identify peer-reviewed papers that describe sensor-integrated helmets capable of crash detection, fatigue detection, GPS tracking, or emergency alerting. Focus on architectures, communication models (GSM, Bluetooth, IoT), and system limitations. Include works that evaluate real-world performance and highlight dependency on mobile networks or cloud services."

Optional refinement:

"Prioritize papers from the last 10 years and include systems that integrate multiple sensors such as IMU, GPS, or physiological monitoring."

---

## 7. Target Outcome of This Role

By completing this role, you should be able to:

- Categorize existing smart helmet implementations
- Identify common architectures (GSM-based, phone-dependent)
- Show that most systems are isolated and non-decentralized
- Demonstrate lack of multimodal fusion and hybrid offline–online design
- Establish the need for a distributed helmet–phone–infrastructure safety system

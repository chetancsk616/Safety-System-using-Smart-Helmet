# Literature Review Collection Guide  
## Role 3: Drowsiness, Fatigue, and Physiological State Detection Systems

## 1. Purpose of This Role

This category focuses on systems designed to detect driver or rider fatigue, drowsiness, microsleep, and physiological abnormalities.

This section supports the multimodal fatigue detection component of the proposed helmet-centric system, particularly:

- Infrared eye-blink detection
- IMU-based head-nod detection
- Multimodal fusion of physiological and motion signals

The goal is to:
- Understand existing fatigue detection techniques
- Compare sensing modalities (camera, IR, EOG, IMU, physiological)
- Identify limitations in wearable and two-wheeler contexts
- Highlight gaps in multimodal and decentralized safety integration

---

## 2. What Needs to Be Collected from Each Paper

For every selected reference, extract:

### A. Detection Modality
- Camera-based eye detection?
- Infrared eye-blink detection?
- Electrooculography (EOG)?
- Electroencephalography (EEG)?
- IMU head movement detection?
- Steering behavior analysis?
- Heart rate or physiological monitoring?

### B. Feature Extraction Method
- Eye Aspect Ratio (EAR)?
- PERCLOS (percentage of eye closure)?
- Blink frequency metrics?
- Head tilt angle thresholds?
- Machine learning model (SVM, CNN, LSTM)?
- Rule-based threshold detection?

### C. Target Application
- Car drivers?
- Truck drivers?
- Pilots?
- Industrial workers?
- Two-wheeler riders?

### D. Processing Location
- Edge device?
- Microcontroller?
- Mobile phone?
- Cloud-based?
- Dedicated embedded processor?

### E. Real-Time Performance
- Reported latency?
- Frame rate?
- Power consumption?
- Accuracy under varying lighting?

### F. Identified Limitations
- Requires high-resolution camera?
- High power consumption?
- Lighting sensitivity?
- Invasive electrodes?
- Not wearable-friendly?
- No integration with communication systems?

---

## 3. Expected Gaps to Look For

While reviewing literature, focus on identifying:

- Systems designed mainly for cars, not helmets
- Camera-dependent systems with high power usage
- Lack of low-power IR-based solutions
- Single-modality detection without sensor fusion
- No integration with accident detection systems
- No decentralized communication integration
- No hybrid offline–online architecture
- No integration with real-time emergency response

These gaps will support your use of:

- IR-based blink detection
- IMU head-nod correlation
- Multimodal fusion with voice and motion
- Offline-capable edge processing

---

## 4. Keywords for Research Paper Platforms  
(IEEE, Springer, ScienceDirect, ACM, Google Scholar)

Primary Keywords:
- Driver drowsiness detection system
- Rider fatigue detection system
- Eye blink detection infrared sensor
- PERCLOS fatigue detection
- Head nod detection using IMU
- Microsleep detection wearable device
- Fatigue detection embedded system
- Real-time eye closure detection
- Wearable drowsiness monitoring

Secondary Modifiers:
- low power implementation
- real time processing
- edge computing fatigue detection
- helmet based detection
- physiological monitoring wearable
- multimodal fatigue detection
- sensor fusion drowsiness detection

Example Combined Queries:
- "Infrared eye blink detection for fatigue monitoring"
- "IMU based head nod drowsiness detection"
- "Wearable fatigue detection system real time"
- "Multimodal driver drowsiness detection using sensor fusion"
- "Low power embedded fatigue monitoring system"

---

## 5. Keywords for Patent Search Platforms  
(Google Patents, WIPO, Espacenet, USPTO)

Use broader and functional terminology.

Set A – Core Fatigue Detection
- Drowsiness detection apparatus
- Eye blink monitoring device
- Fatigue detection wearable system
- Microsleep detection apparatus
- Rider alertness monitoring system

Set B – IR and Non-Camera Methods
- Infrared eye closure detection device
- Optical blink sensing apparatus
- Non-camera eye monitoring system
- Reflective eye state detection apparatus

Set C – Multimodal Fusion
- Multisensor fatigue detection system
- Motion and physiological monitoring apparatus
- Head tilt and eye closure detection device
- Integrated rider alertness monitoring system

Use claim-style descriptors:
- apparatus
- method
- wearable device
- sensor module
- embedded fatigue detection system

---

## 6. IEEE Xplore AI Search Prompt

You may paste the following into IEEE Xplore AI search:

Prompt:

"I am conducting a literature review on drowsiness and fatigue detection systems, particularly focusing on eye-blink detection, infrared-based eye monitoring, head-nod detection using IMU sensors, and wearable fatigue monitoring devices. Please identify peer-reviewed papers that evaluate real-time performance, power efficiency, and multimodal fusion techniques. Emphasize embedded or edge implementations rather than purely cloud-based systems."

Optional refinement:

"Prioritize works applicable to two-wheeler riders or wearable systems, and include comparisons of camera-based and non-camera-based approaches."

---

## 7. Target Outcome of This Role

After completing this section, you should be able to:

- Compare camera-based vs IR-based fatigue detection
- Highlight power and lighting limitations of existing methods
- Show lack of integration between fatigue detection and communication systems
- Demonstrate that most works are single-modality
- Justify your IR + IMU multimodal fusion approach
- Establish the need for helmet-integrated, offline-capable fatigue detection

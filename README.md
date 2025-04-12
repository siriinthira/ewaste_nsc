# e-Waste
Build a Prototype of an e-Waste Management System

---------------------------------------------------------------------------
# UX UI Designer

# Empathize 
The empathize stage involves understanding the users and their needs in order to create a solution that addresses the challenges they face in managing e-waste. Based on the provided concept, the target users are:

**People who need to dispose of electronic waste (E-Waste):** This includes general consumers who have non-functional electronics or electronics that have reached the end of their useful life. They may not know where to dispose of them or how to do it responsibly.

**Stakeholders in e-waste management:** This includes volunteers, government agencies, and private organizations responsible for the collection, recycling, and disposal of e-waste. These users need tools to track the disposal process and ensure proper handling of waste.

**Key insights from user research:**

**People** need a simple, convenient, and trustworthy way to dispose of e-waste.

**Stakeholders** need efficient tools to monitor and manage the disposal process, as well as ensure transparency and accountability.

**Environmental impact** is a concern for all parties, so the solution should highlight sustainability and health safety.


# Define

**Problem Statement:**
In Thailand, the amount of e-waste is increasing significantly, and people do not have an efficient or convenient way to dispose of their e-waste. Improper disposal leads to environmental degradation, health risks, and reduced quality of life. There is a lack of transparency in the management of e-waste disposal, and citizens are often unaware of where to dispose of their electronic waste.

**Design Goals:**

**Provide convenience:** Users should be able to easily find e-waste disposal points near them and request assistance (volunteers) for pickup.

**Ensure accountability:** Using Blockchain to track and provide transparency regarding the status of e-waste disposal.

**Raise awareness:** Provide users with clear information about the environmental impact and health risks of improper e-waste disposal.

**Increase user engagement:** Create a sense of community involvement in proper e-waste management.

# Ideate

In this phase, we brainstorm and come up with potential design solutions that address the needs and goals established in the define stage.

**Key Features to Implement:**

**User Profiles & Authentication:**

**End users (consumers):** Simple login with social media or email, enabling easy access to disposal services.

**Admin/Volunteers:** More detailed profiles to manage collection points and track e-waste disposal.

**E-Waste Collection Points Map:**

A map interface where users can search and locate the nearest e-waste disposal points.

Filters for types of e-waste accepted, availability of volunteers, and hours of operation.

**Request Pickup Feature:**

A button for users to request a volunteer to pick up their e-waste directly from their location.

A real-time tracking system that shows the volunteer’s estimated time of arrival.

E-Waste Tracking & Transparency (Blockchain Integration):

A Blockchain ledger that records every step of the e-waste disposal process for transparency.

Users can check the disposal history for accountability (who is responsible, where and when the waste was disposed of, and its final destination).

**Notifications & Reminders:**

Push notifications to remind users about upcoming scheduled pickups, local disposal points, or new information about e-waste disposal.

Feedback loops where users can rate their experience and report issues with e-waste management.

**Educational Section:**

Information on the dangers of improper disposal and how proper e-waste management can contribute to a healthier environment.

Tutorial videos on how to correctly prepare e-waste for disposal (e.g., removing batteries).

**Sustainability & Community Engagement:**

A rewards system that incentivizes users for properly disposing of e-waste or participating in community programs (e.g., points for each e-waste disposal that can be redeemed for rewards).

A community forum where users can share tips, post local e-waste disposal events, and discuss environmental sustainability.

---------------------------------------------------------------------------

# User Persona

**User Persona 1:**

Name: Sudarat Chaiyathavorn
Age: 35
Occupation: Office Manager
Location: Bangkok, Thailand
Technology Use: Active smartphone user, familiar with apps, but not very tech-savvy

Goals:
Dispose of her old electronics in a safe, environmentally-friendly manner.

Find nearby e-waste collection points or arrange for a pickup without any hassle.

Contribute to environmental sustainability.

Pain Points:

Doesn’t know where to dispose of old electronics like broken phones, chargers, and used batteries.

Unsure about the proper way to dispose of e-waste to prevent harm to the environment.

Concerned about privacy and safety in sharing her personal information when disposing of electronic waste.

Technology Comfort:
Sudarat is comfortable with smartphones and uses apps for daily tasks but requires a simple, straightforward interface.

Personality:
Practical and solution-oriented. She values convenience, sustainability, and transparency. She wants to contribute to a cleaner environment but is not familiar with e-waste management procedures.

**User Persona 2:**

Name: Kittiphong Panya
Age: 40
Occupation: Environmental Agency Worker (E-Waste Collector)
Location: Chiang Mai, Thailand
Technology Use: Comfortable using mobile apps and software for work and personal use

Goals:
Monitor the status of e-waste collection and ensure proper recycling/disposal.

Receive and process user requests for e-waste pickup or drop-off at local collection points.

Improve the efficiency and transparency of the e-waste management process through technology.

Pain Points:
Difficulties in tracking the volume of e-waste and ensuring timely collection.

Lack of real-time communication with users about their disposal requests and the status of their e-waste.

Uncertainty about whether collected e-waste is being disposed of properly, which could affect public health and the environment.

Technology Comfort:
Kittiphong is tech-savvy and used to working with digital systems to manage resources and track processes.

Personality:
Responsible and detail-oriented. He cares deeply about environmental sustainability and public health. He is proactive in finding ways to improve systems for better management.

---------------------------------------------------------------------------

# User Scenario
Sudarat Chaiyathavorn, a 35-year-old office manager, is looking to dispose of her broken phone responsibly. 
She uses the app to locate the nearest collection point, but since she’s busy, she opts to request a pickup. 
She schedules the pickup and receives confirmation through the app. After the pickup is completed, she checks the
status of her e-waste using the blockchain ledger to ensure it was recycled properly.

---------------------------------------------------------------------------

# User Story

**User Story 1: Sudarat Chaiyathavorn (End User - Consumer)**
As a consumer who needs to dispose of old electronics,
I want to easily find nearby e-waste collection points or request a pickup,
so that I can safely and conveniently dispose of my old electronics without contributing to environmental harm.

**Acceptance Criteria:**
The app should have an interactive map showing nearby e-waste collection points.

The user can filter results by the types of e-waste accepted and their operating hours.

A simple, intuitive interface allows users to request a pickup and schedule a time for a volunteer to collect the waste.

Notifications should be sent to users for confirmation, reminders, and status updates on pickup.

The app should provide educational resources on the dangers of improper e-waste disposal.


**User Story 2: Kittiphong Panya (E-Waste Management Worker)**
As an e-waste management worker,
I want to track and manage e-waste pickup requests from users in real-time,
so that I can efficiently collect and dispose of electronic waste, ensuring it is handled responsibly.

**Acceptance Criteria:**
The app allows Kittiphong to view requests for pickups from users in real-time and track the status of each request.

Kittiphong can confirm when a pickup has been completed, and the app will automatically update the user.

The app should integrate with a blockchain ledger to track the disposal process and ensure transparency, showing where the e-waste goes after it is collected.

Users should be able to rate the collection process, allowing Kittiphong to gather feedback on the service and improve operations.

Kittiphong can also update the status of local collection points (e.g., hours of operation or changes in accepted waste types).


**User Story 3: Sudarat Chaiyathavorn (End User - Consumer)**
As a consumer who values transparency,
I want to see the status of my e-waste after disposal,
so that I can be assured that my waste was handled properly and ethically.

**Acceptance Criteria:**
After a successful disposal or pickup, the app should provide a blockchain-based record showing the status of the e-waste from collection to final disposal.

Sudarat can view details about where her e-waste was sent, whether it was recycled or disposed of responsibly, and the impact on the environment.

Users can access feedback on the e-waste management process, showing transparency and accountability.


**User Story 4: Kittiphong Panya (E-Waste Management Worker)**

As an e-waste management worker,
I want to ensure that the e-waste collected is disposed of according to regulations,
so that I can maintain public trust and comply with environmental regulations.

Acceptance Criteria:
The app should allow Kittiphong to log each collected item, detailing its type and the responsible recycling or disposal method used.

The app will provide guidelines for e-waste disposal, ensuring compliance with local and international environmental laws.

A transparent ledger on the blockchain will record all actions taken during the disposal process for auditability.

Kittiphong should have access to a report showing the types and amounts of e-waste collected to optimize future collection efforts.

--------------------------------------------------------------------------

# Wireframe V.1
....

# Mockup V.1
https://www.figma.com/design/VtwxFNgE29Y8gkZaFlGXQv/E-waste?node-id=0-1&t=AeWEGPC0mlk2p8Yq-1

# Prototype V.1
wireframe, mockup, prototype (re-do), user flow diagram
<p>
  <img src = "https://github.com/user-attachments/assets/709dc2d9-5946-42fd-97b2-086bb6a19633"/>
</p>
<p>
  <img src = "https://github.com/user-attachments/assets/fe567461-dd00-43ad-bd95-57e96ae3bcce"/>
</p>

---------------------------------------------------------------------------


# User Journey

A user journey for Sudarat:

Launch App → Find Nearby Collection Points → Select Pickup Option → Confirm Pickup Time → Receive Pickup Confirmation → Wait for Pickup → Check Blockchain Status After Disposal → Rate the Service.

# Pain Points

# User Testing, Feedback & Interview

---------------------------------------------------------------------------

# Wireframe V.2

**Wireframe & User Flow Ideas:**

**Onboarding Screen:**

Simple introduction of the app’s goals and a clear call to action: “Find nearby e-waste disposal points.”

**Main Screen (Home Page):**

Map view of nearby e-waste disposal points.

Quick access to request pickup and view notifications.

Display of educational resources on e-waste management.

**Request Pickup Flow:**

Users tap a “Request Pickup” button.

Select the type of e-waste and schedule a pickup time.

Confirm details and track the assigned volunteer's progress.

**Blockchain Tracking Screen:**

A visual ledger showing the journey of the e-waste: pick-up, transportation, recycling, and final disposal.

**User Profile:**

Display user’s past e-waste disposal history, feedback, and rewards earned.


# Mockup V.2

# Prototype V.2


----------------------------------------------------------------------------------



# Database Design
  <img src = "https://github.com/user-attachments/assets/50e8861f-98d2-492d-a67a-229a1ff45c28"/>
</p>




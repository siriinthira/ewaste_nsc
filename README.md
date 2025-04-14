# e-Waste
Build a Prototype of an e-Waste Management System

**Project Goal**

The goal of the E-Waste Management App is to provide a user-friendly, efficient, and secure platform for individuals to dispose of electronic waste responsibly. The app aims to:

Streamline e-waste disposal through easy-to-use features for logging items and choosing between pickup or drop-off methods.

Enhance community involvement by offering volunteer collectors incentives and rewards for their participation.

Ensure proper handling of sensitive data by securely wiping or destroying personal information on devices before recycling.

Promote environmental sustainability by facilitating the proper recycling of e-waste through certified recycling centers and material recovery.

Educate and engage users by providing an intuitive, gamified experience, encouraging more responsible e-waste disposal and rewarding eco-friendly behavior.

# ♻️ How the E-Waste Management App Works

**1. User Profile Setup**

Users register with their name, contact details, and default address.

This info helps in tracking pickups, item history, and communication.

**2. Add E-Waste Items**

Users log items they want to dispose of, providing:

Serial No. (for tracking)

Item Genre (e.g., mobile phone, monitor, battery)

Weight

Size

Quantity or Estimated Value

Photo of the Item

**3. View Submitted Items**

Users can review, edit, or delete previously added items.

Each item shows its current status (pending, scheduled, completed, etc.).

**4. Choose Disposal Method**

**a) Request a Collector Pickup**

When the user requests a pickup:

They select a pickup location on the map (can be different from their profile address).

A volunteer collector is notified, accepts the request, and proceeds to the designated location.

The items are picked up and delivered to the Collection & Sorting Center .

**✅ Collector Incentive System**

Volunteer collectors receive points for each pickup they complete.

Points may depend on factors like:

Type and weight of e-waste

Distance traveled

Number of pickups completed

**🎁 Rewards & Recognition**

How these points are used depends on the company, NGO, or organization running the program.

Points may be redeemed for eco-friendly rewards, gift cards, certificates, or community benefits.

**b) Drop Off at a Nearby Bin**

Users can also drop off items at designated e-waste bins, shown on an interactive map.

These bins are emptied regularly, and items are forwarded to the sorting center.

**5. Sorting & Confidentiality Checks**

At the Sorting Center, items are:

Verified and sorted

Devices with personal or sensitive data undergo secure data wiping or destruction

**6. Recycling Process**

Items are forwarded to certified recycling facilities for:

Disassembly 

Material recovery and reuse

---------------------------------------------------------------------------
# UX UI Design Process

# Empathize 
The empathize stage involves understanding the users and their needs in order to create a solution that addresses the challenges they face in managing e-waste. 

**Target Users:**

**People who need to dispose of electronic waste (E-Waste):** This includes general consumers who have non-functional electronics or electronics that have reached the end of their useful life. They may not know where to dispose of them or how to do it responsibly.

**Stakeholders in e-waste management:** This includes volunteers, government agencies, and private organizations responsible for the collection, recycling, and disposal of e-waste. These users need tools to track the disposal process and ensure proper handling of waste.

**Key insights from user research:**

**People** need a simple, convenient, and trustworthy way to dispose of e-waste.

**Stakeholders** need efficient tools to monitor and manage the disposal process, as well as ensure transparency and accountability.

**Environmental impact** is a concern for all parties, so the solution should highlight sustainability and health safety.

# KPIs

**User Engagement:**

Active Users: Track daily/weekly/monthly active users to measure engagement.

Item Submission Rate: Monitor how many items users log for disposal.

**Collection & Pickup Efficiency:**

Pickup Completion Rate: Measure the percentage of pickup requests completed.

Average Pickup Time: Track the average time for volunteers to complete pickups.

**Volunteer Engagement:**

Volunteer Pickup Completion Rate: Monitor how many pickup assignments volunteers complete.

**Recycling Efficiency:**

Amount of E-Waste Collected: Track the total weight or volume of e-waste collected.

Items Recycled Responsibly: Measure the percentage of items recycled or disposed of properly.

**User Satisfaction:**

User Retention Rate: Track how many users return to the app after their first use.

App Rating: Measure user feedback and satisfaction through ratings and reviews.

# Define

**Problem Statement:**
In Thailand, the amount of e-waste is increasing significantly, and people do not have an efficient or convenient way to dispose of their e-waste. Improper disposal leads to environmental degradation, health risks, and reduced quality of life. There is a lack of transparency in the management of e-waste disposal, and citizens are often unaware of where to dispose of their electronic waste.

♻️ **User Needs – Summary**
Easy and convenient ways to dispose of e-waste
(via pickup requests or nearby drop-off bins)

Clear instructions on acceptable e-waste items
(item types, preparation steps, etc.)

Real-time tracking and status updates
(from item submission to recycling)

Assurance of secure data handling
(especially for devices with personal information)

Incentives and rewards for participation
(eco-points, certificates, community recognition)

Educational insights about environmental impact
(e.g., how recycling helps reduce pollution)

Simple and user-friendly app experience
(intuitive design, easy navigation)

Personalized profile and history tracking
(view past submissions, manage pickups)

Local language and regional support
(for accessibility and relevance)

Trustworthy and transparent process
(with certified partners and ethical practices)

**Design Goals:**

**Provide convenience:** Users should be able to easily find e-waste disposal points near them and request assistance (volunteers) for pickup.

**Ensure accountability:** Using Blockchain to track and provide transparency regarding the status of e-waste disposal.

**Raise awareness:** Provide users with clear information about the environmental impact and health risks of improper e-waste disposal.

**Increase user engagement:** Create a sense of community involvement in proper e-waste management.





# User Persona

<img src = "https://github.com/user-attachments/assets/bd6b311e-995d-4c4d-b405-aeee7d081454"/>


<img src = "https://github.com/user-attachments/assets/ed11b302-719e-44fa-ab5a-f110da229cdc"/>




# User Scenario
Sudarat Chaiyathavorn, a 35-year-old office manager, is looking to dispose of her broken phone responsibly. 
She uses the app to locate the nearest collection point, but since she’s busy, she opts to request a pickup. 
She schedules the pickup and receives confirmation through the app. After the pickup is completed, she checks the
status of her e-waste using the blockchain ledger to ensure it was recycled properly.



# User Journey & Pain Points

A user journey for Sudarat:

Launch App → Find Nearby Collection Points → Select Pickup Option → Confirm Pickup Time → Receive Pickup Confirmation → Wait for Pickup → Check Blockchain Status After Disposal → Rate the Service.


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

---------------------------------------------------------------------------

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

# User Flow v1
...

# Wireframe v1
....

# Mockup v1
https://www.figma.com/design/VtwxFNgE29Y8gkZaFlGXQv/E-waste?node-id=0-1&t=AeWEGPC0mlk2p8Yq-1

# Prototype v1
wireframe, mockup, prototype (re-do), user flow diagram
<p>
  <img src = "https://github.com/user-attachments/assets/709dc2d9-5946-42fd-97b2-086bb6a19633"/>
</p>
<p>
  <img src = "https://github.com/user-attachments/assets/fe567461-dd00-43ad-bd95-57e96ae3bcce"/>
</p>

---------------------------------------------------------------------------

# Usability Testing v1

---------------------------------------------------------------------------

# User Flow v2

# Wireframe v2

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


# Mockup v2

# Prototype v2


----------------------------------------------------------------------------------

# What I Learned
----------------------------------------------------------------------------------



# Database Design
  <img src = "https://github.com/user-attachments/assets/50e8861f-98d2-492d-a67a-229a1ff45c28"/>
</p>




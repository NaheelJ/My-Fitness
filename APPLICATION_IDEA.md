# 🚀 FINAL APP PROMPT — 90 DAYS DISCIPLINE

## 🎯 PURPOSE

Build a Flutter mobile application called **“90 Days Discipline”**.

This app is not just a habit tracker. It must function as:

* A **Guide** (clear instructions for daily routine)
* A **Reminder** (timely notifications)
* A **Discipline System** (rules, streaks, consequences)

Goal: Help the user complete a **90-day life transformation**.

---

# 🧠 CORE SYSTEM

## 🔘 DAY TYPE SELECTION

At the start of each day, the user must choose:

* Working Day
* Holiday / Non-Working Day

### Logic:

* Working Day → Full routine
* Holiday → Flexible routine (lighter but not skipped)

---

# 📊 MAIN FEATURES

## 1. 🏠 HOME SCREEN

Display:

* Day (X / 90)
* Progress bar
* Streak 🔥
* Day type (Working / Holiday)

### Daily Checklist:

* Wake up on time (5:30 AM)
* Prayer completed
* Breakfast
* Lunch
* Evening nutrition
* Dinner
* Water intake (2.5–3L)
* Workout / Activity
* No smoking
* No porn
* Sleep before 11 PM

Each item:

* Toggle (true/false)
* Click → opens detailed explanation

---

## 2. 📖 TASK DETAIL VIEW

Each task must include:

* What to do
* Why it matters
* What to avoid
* Simple actionable steps

---

## 3. ⚠️ DISCIPLINE RULE ENGINE

### Rules:

* Missing 1–2 days → allowed
* Missing 3–6 days → activate **Comeback Mode**
* Missing 7 consecutive days → RESET

### Reset:

* Day → 1
* Streak → 0
* History → preserved

---

## 4. 📊 PARTIAL COMPLETION SYSTEM

* Track completion percentage per day

### Logic:

* ≥80% → Successful day ✅
* 50–79% → Average ⚠️
* <50% → Failed ❌

---

## 5. 🔥 STREAK SYSTEM

* Increase when ≥80% completion
* Reset if failed
* Show motivational messages:

  * Day 3 → “Good start”
  * Day 7 → “Discipline building”
  * Day 30 → “You are changing”

---

## 6. 🎟 SKIP TOKEN SYSTEM

* 1 skip allowed per week
* Prevent burnout
* Does not break streak

---

## 7. 💧 WATER TRACKING

* Daily goal: 2.5–3 litres
* Simple progress indicator

---

## 8. ⚖️ WEIGHT TRACKING

* Weekly input
* Display progress graph

---

## 9. 🧠 LAZY MODE BUTTON

Button: “I feel lazy”

Show:

* Do 10 push-ups
* Drink water
* Walk for 5 minutes

---

## 10. 📅 WEEKLY SUMMARY

Display:

* Completed days
* Missed days
* Habit weaknesses
* Improvement suggestions

---

## 11. 🔒 DAILY LOCK SYSTEM

* Lock previous day after 24 hours
* Prevent editing past data

---

## 12. ☁️ DATA MANAGEMENT

### Local:

* Hive / SharedPreferences (offline-first)

### Cloud:

* Firebase Firestore (sync)

### Firestore Structure:

users/
userId/
currentDay
streak
lastActiveDate
history/
dayId/
date
dayType
completionPercentage
tasks
isCompleted

---

## 13. 🔔 REMINDER SYSTEM

* Morning reminder (5:30–7 AM)
* Evening reminder (4–6 PM)
* Night reminder (10 PM)

---

## 14. 🧭 ONBOARDING FLOW

Explain:

* Purpose of app
* 90-day system
* Discipline rules

---

# 📖 ROUTINE DOCUMENTATION

## 🌅 MORNING (5:30 AM)

* Wake up for Fajr
* No phone (30 minutes)
* Drink water

---

## 🕌 PRAYER

* Perform all daily prayers

---

## 🍽 BREAKFAST

Options:

* Putt + kadala curry
* Chapathi + omelette
* Appam + egg curry

Add:

* Banana OR milk

Avoid:

* Skipping
* Only tea

---

## 💧 WATER

Drink 2.5–3 litres daily

---

## 🍛 LUNCH

* Rice
* Fish/chicken
* Vegetable
* Dal (optional)

---

## ☕ EVENING

If no snacks:

* Milk (best)
* Tea (low sugar)
* Water (temporary)

---

## 💪 WORKOUT

### Working Day:

* Push-ups
* Incline push-ups
* Squats
* Plank

### Holiday:

* Walking / stretching / sports

---

## 🍽 DINNER

* Rice or chapathi
* Protein
* Vegetable

---

## 📵 MOBILE CONTROL

* No phone after 11 PM

---

## 🚫 BAD HABITS

* Stop smoking
* Avoid porn gradually

---

## 😴 SLEEP

* Sleep before 11 PM

---

# 📅 HOLIDAY MODE

## RULE:

Routine stays, intensity reduces

### Morning:

* Same as working day

### Workout:

* Light activity

### Food:

* Slightly relaxed but not skipped

### Avoid:

* Full day phone use
* Laziness

---

# 🔥 FINAL PRINCIPLE

This system is not about perfection.

It is about:

* Consistency
* Discipline
* Daily improvement

Follow for 90 days to transform your body, mind, and life.

---

# 🧠 DEVELOPMENT RULE

Do NOT overcomplicate.

Focus on:

* Clarity
* Speed
* Daily usability


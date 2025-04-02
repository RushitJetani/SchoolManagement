# 🏫 School Management System

A full-stack, role-based **School Management Application** built with modern technologies including **Next.js**, **Prisma**, **Tailwind CSS**, **Docker**, and **Clerk** for authentication.

## 🚀 Live Demo

🌐 [View Deployed App on Vercel](https://school-management-ecru.vercel.app/)

> 🔐 **Login Credentials**

| Role    | Username       | Password  |
|---------|----------------|-----------|
| Admin   | `admin`       | `admin` |
| Teacher | `RushitJetani`     | `Jetani@2006` |
| Student | `KathanParekh`     | `Kathan@2006` |
| Parent  | `PruthviPatel`    | `Pruthvi@2006` |

---

## ✨ Features

- ✅ Role-based authentication (`admin`, `teacher`, `student`, `parent`)
- 🧑‍🏫 Teacher dashboard for managing lessons, exams, attendance
- 👩‍🎓 Student & Parent dashboards for viewing schedules, announcements, results
- 📣 Real-time Announcements & Events
- 📅 Calendar View for classes and events
- 📊 Result and attendance tracking
- 📁 Dockerized for consistent development and deployment
- ☁️ Hosted on **Vercel**

---

## 🛠️ Tech Stack

- **Frontend**: React (Next.js 13+), Tailwind CSS
- **Backend**: Node.js (API routes), Prisma ORM
- **Database**: PostgreSQL
- **Authentication**: Clerk
- **Deployment**: Vercel
- **Containerization**: Docker
- **Validation**: Zod + React Hook Form
- **Cloud Media Upload**: Cloudinary

---

## 🧱 Database Models

- `Admin`
- `Teacher`
- `Student`
- `Parent`
- `Class`, `Grade`, `Subject`
- `Lesson`, `Exam`, `Assignment`, `Result`
- `Announcement`, `Event`, `Attendance`

---

## 📦 Getting Started Locally

```bash
# Clone the repository
git clone https://github.com/RushitJetani/SchoolManagement.git
cd SchoolManagement

# Install dependencies
npm install

# Create a .env file
# Fill in your DATABASE_URL and Clerk credentials

# Set up Prisma
npx prisma generate
npx prisma migrate dev --name init

# Run the app
npm run dev

import { Day, PrismaClient, UserSex } from "@prisma/client";
const prisma = new PrismaClient();

async function main() {
  // ADMIN
  await prisma.admin.create({
    data: {
      id: "admin1",
      username: "admin1",
    },
  });
  await prisma.admin.create({
    data: {
      id: "admin2",
      username: "admin2",
    },
  });

  // GRADE
  for (let i = 1; i <= 6; i++) {
    await prisma.grade.create({
      data: {
        level: i,
      },
    });
  }

  // CLASS
  for (let i = 1; i <= 6; i++) {
    await prisma.class.create({
      data: {
        name: `${i}A`,
        gradeId: i,
        capacity: Math.floor(Math.random() * (20 - 15 + 1)) + 15,
      },
    });
  }

  // SUBJECT
  const subjectData = [
    { name: "Mathematics" },
    { name: "Science" },
    { name: "English" },
    { name: "History" },
    { name: "Geography" },
    { name: "Physics" },
    { name: "Chemistry" },
    { name: "Biology" },
    { name: "Computer Science" },
    { name: "Art" },
  ];

  for (const subject of subjectData) {
    await prisma.subject.create({ data: subject });
  }

  // TEACHER
  const teacherNames = [
    "Priya",
    "Rajesh",
    "Neha",
    "Vikram",
    "Anjali",
    "Suresh",
    "Pooja",
    "Ravi",
    "Deepika",
    "Amit",
    "Shalini",
    "Sanjay",
    "Meena",
    "Rahul",
    "Divya",
  ];
  const surnames = [
    "Sharma",
    "Verma",
    "Singh",
    "Gupta",
    "Yadav",
    "Patel",
    "Mehra",
    "Khanna",
    "Desai",
    "Kapoor",
    "Malhotra",
    "Reddy",
    "Khan",
    "Agarwal",
    "Jain",
  ];
  const cities = [
    "Delhi",
    "Mumbai",
    "Bangalore",
    "Kolkata",
    "Chennai",
    "Hyderabad",
    "Ahmedabad",
    "Pune",
    "Surat",
    "Jaipur",
    "Lucknow",
    "Kanpur",
    "Nagpur",
    "Indore",
    "Bhopal",
  ];

  for (let i = 0; i < 15; i++) {
    const teacherName = teacherNames[i];
    const surname = surnames[i % surnames.length];
    const city = cities[i % cities.length];
    const phonePrefix = Math.floor(Math.random() * 10) + 7; // Random prefix from 7 to 9
    const phoneNumber = `${phonePrefix}${Math.floor(Math.random() * 10000000)}`;
    const sex = i % 2 === 0 ? UserSex.MALE : UserSex.FEMALE;
    const bloodTypeOptions = ["O+", "A+", "B+", "AB+"];
    const bloodType = bloodTypeOptions[Math.floor(Math.random() * bloodTypeOptions.length)];

    await prisma.teacher.create({
      data: {
        id: `teacher${i + 1}`, // Unique ID for the teacher
        username: `teacher${i + 1}`,
        name: teacherName,
        surname: surname,
        email: `teacher${i + 1}@example.com`,
        phone: `+91 ${phoneNumber}`,
        address: `${city}, India`,
        bloodType: bloodType,
        sex: sex,
        subjects: { connect: [{ id: (i % 10) + 1 }] },
        classes: { connect: [{ id: (i % 6) + 1 }] },
        birthday: new Date(new Date().setFullYear(new Date().getFullYear() - 30)),
      },
    });
  }

  // LESSON
  for (let i = 1; i <= 30; i++) {
    const randomDay = Object.keys(Day)[Math.floor(Math.random() * Object.keys(Day).length)] as keyof typeof Day;
    const startHour = Math.floor(Math.random() * 2) + 8; // Random hour between 8 and 9
    const startTime = new Date(new Date().setHours(startHour, Math.floor(Math.random() * 60), 0, 0));
    const endTime = new Date(startTime);
    endTime.setHours(startTime.getHours() + 1 + Math.floor(Math.random() * 2)); // Lesson duration 1-3 hours

    await prisma.lesson.create({
      data: {
        name: `Lesson ${i}`,
        day: Day[randomDay],
        startTime: startTime,
        endTime: endTime,
        subjectId: (i % 10) + 1,
        classId: (i % 6) + 1,
        teacherId: `teacher${(i % 15) + 1}`,
      },
    });
  }

  // PARENT
  const parentNames = [
    "Prakash",
    "Sunita",
    "Rakesh",
    "Nisha",
    "Vijay",
    "Priti",
    "Sandeep",
    "Manju",
    "Rajeshwari",
    "Vikram",
    "Anita",
    "Suresh",
    "Jyoti",
    "Gaurav",
    "Pooja",
    "Ravi",
    "Deepak",
    "Shweta",
    "Anil",
    "Mamta",
    "Rohit",
    "Neha",
    "Saurabh",
    "Priya",
    "Arjun",
  ];
  const parentSurnames = [
    "Verma",
    "Singh",
    "Sharma",
    "Patel",
    "Kumar",
    "Gupta",
    "Yadav",
    "Devi",
    "Rao",
    "Singh",
    "Mehra",
    "Khanna",
    "Desai",
    "Kapoor",
    "Malhotra",
    "Reddy",
    "Khan",
    "Jain",
    "Agarwal",
    "Srivastava",
    "Tiwari",
    "Chaturvedi",
    "Mishra",
    "Pandey",
    "Saxena",
  ];

  for (let i = 0; i < 25; i++) {
    const parentName = parentNames[i];
    const surname = parentSurnames[i % parentSurnames.length];
    const city = cities[i % cities.length];
    const phonePrefix = Math.floor(Math.random() * 10) + 7; // Random prefix from 7 to 9
    const phoneNumber = `${phonePrefix}${Math.floor(Math.random() * 10000000)}`;

    await prisma.parent.create({
      data: {
        id: `parentId${i + 1}`,
        username: `parentId${i + 1}`,
        name: parentName,
        surname: surname,
        email: `parent${i + 1}@example.com`,
        phone: `+91 ${phoneNumber}`,
        address: `${city}, India`,
      },
    });
  }

  // STUDENT
  const studentNames = [
    "Aryan",
    "Diya",
    "Vivaan",
    "Aarav",
    "Anika",
    "Advait",
    "Siya",
    "Vihaan",
    "Myra",
    "Reyansh",
    "Kiara",
    "Ishaan",
    "Aanya",
    "Kabir",
    "Navya",
    "Rohan",
    "Aaradhya",
    "Vivaan",
    "Ishani",
    "Ved",
    "Sara",
    "Neil",
    "Ananya",
    "Dhruv",
    "Ishika",
    "Kiaan",
    "Samaira",
    "Vivaan",
    "Aarohi",
    "Reyansh",
    "Siya",
    "Vivaan",
    "Anika",
    "Advait",
    "Diya",
    "Aryan",
    "Ananya",
    "Vihaan",
    "Aarav",
    "Siya",
    "Kabir",
    "Navya",
    "Rohan",
    "Aaradhya",
    "Vivaan",
    "Ishani",
    "Ved",
    "Sara",
    "Neil",
    "Ananya",
  ];
  const studentSurnames = [
    "Sharma",
    "Patel",
    "Singh",
    "Verma",
    "Gupta",
    "Yadav",
    "Mehra",
    "Khanna",
    "Desai",
    "Kapoor",
    "Malhotra",
    "Reddy",
    "Khan",
    "Jain",
    "Agarwal",
    "Srivastava",
    "Tiwari",
    "Chaturvedi",
    "Mishra",
    "Pandey",
    "Saxena",
    "Arora",
    "Bansal",
    "Bhargava",
    "Bhushan",
    "Chawla",
    "Chopra",
    "Goel",
    "Gupta",
    "Jain",
    "Kapoor",
    "Khanna",
    "Malhotra",
    "Mehra",
    "Mittal",
    "Narula",
    "Oberoi",
    "Sharma",
    "Singh",
    "Sood",
    "Tandon",
    "Verma",
    "Yadav",
    "Arora",
    "Bansal",
    "Bhargava",
    "Bhushan",
    "Chawla",
    "Chopra",
    "Goel",
  ];
  const bloodTypeOptions = ["O+", "A+", "B+", "AB+", "O-", "A-", "B-", "AB-"];

  for (let i = 0; i < 50; i++) {
    const studentName = studentNames[i];
    const surname = studentSurnames[i % studentSurnames.length];
    const city = cities[i % cities.length];
    const phonePrefix = Math.floor(Math.random() * 10) + 7; // Random prefix from 7 to 9
    const phoneNumber = `${phonePrefix}${Math.floor(Math.random() * 10000000)}`;
    const sex = i % 2 === 0 ? UserSex.MALE : UserSex.FEMALE;
    const bloodType = bloodTypeOptions[Math.floor(Math.random() * bloodTypeOptions.length)];

    await prisma.student.create({
      data: {
        id: `student${i + 1}`,
        username: `student${i + 1}`,
        name: studentName,
        surname: surname,
        email: `student${i + 1}@example.com`,
        phone: `+91 ${phoneNumber}`,
        address: `${city}, India`,
        bloodType: bloodType,
        sex: sex,
        parentId: `parentId${Math.ceil((i + 1) / 2) % 25 || 25}`,
        gradeId: (i % 6) + 1,
        classId: (i % 6) + 1,
        birthday: new Date(new Date().setFullYear(new Date().getFullYear() - 10)),
      },
    });
  }

  // EXAM
  for (let i = 1; i <= 10; i++) {
    const lessonIndex = (i % 30) + 1;
    const lesson = await prisma.lesson.findUnique({ where: { id: lessonIndex } });
    const startTime = new Date(lesson?.startTime || new Date());
    startTime.setHours(startTime.getHours() + 1);
    const endTime = new Date(startTime);
    endTime.setHours(startTime.getHours() + 2);

    await prisma.exam.create({
      data: {
        title: `Exam ${i}`,
        startTime: startTime,
        endTime: endTime,
        lessonId: lessonIndex,
      },
    });
  }

  // ASSIGNMENT
  for (let i = 1; i <= 10; i++) {
    const lessonIndex = (i % 30) + 1;
    const lesson = await prisma.lesson.findUnique({ where: { id: lessonIndex } });
    const startDate = new Date(lesson?.startTime || new Date());
    startDate.setHours(startDate.getHours() + 1);
    const dueDate = new Date(startDate);
    dueDate.setDate(startDate.getDate() + 1);

    await prisma.assignment.create({
      data: {
        title: `Assignment ${i}`,
        startDate: startDate,
        dueDate: dueDate,
        lessonId: lessonIndex,
      },
    });
  }

  // RESULT
  for (let i = 1; i <= 10; i++) {
    await prisma.result.create({
      data: {
        score: Math.floor(Math.random() * 101), // Random score between 0 and 100
        studentId: `student${i}`,
        ...(i <= 5 ? { examId: i } : { assignmentId: i - 5 }),
      },
    });
  }

  // ATTENDANCE
  const today = new Date();
  for (let i = 1; i <= 10; i++) {
    await prisma.attendance.create({
      data: {
        date: today,
        present: Math.random() < 0.8, // 80% chance of being present
        studentId: `student${i}`,
        lessonId: (i % 30) + 1,
      },
    });
  }

  // EVENT
  for (let i = 1; i <= 5; i++) {
    const classId = (i % 5) + 1;
    const startTime = new Date(new Date().setHours(new Date().getHours() + 1 + i));
    const endTime = new Date(startTime);
    endTime.setHours(startTime.getHours() + 2);

    await prisma.event.create({
      data: {
        title: `Event ${i}`,
        description: `Description for Event ${i}`,
        startTime: startTime,
        endTime: endTime,
        classId: classId,
      },
    });
  }

  // ANNOUNCEMENT
  for (let i = 1; i <= 5; i++) {
    const classId = (i % 5) + 1;

    await prisma.announcement.create({
      data: {
        title: `Announcement ${i}`,
        description: `Description for Announcement ${i}`,
        date: new Date(),
        classId: classId,
      },
    });
  }

  console.log("Seeding completed successfully with real data.");
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
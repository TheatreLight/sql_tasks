CREATE TABLE Departments (
    DepartmentID SERIAL PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE Roles (
    RoleID SERIAL PRIMARY KEY,
    RoleName VARCHAR(100) NOT NULL
);

CREATE TABLE Employees (
    EmployeeID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Position VARCHAR(100),
    ManagerID INT,
    DepartmentID INT,
    RoleID INT,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID) ON DELETE SET NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) ON DELETE CASCADE,
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID) ON DELETE SET NULL
);

CREATE TABLE Projects (
    ProjectID SERIAL PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) ON DELETE CASCADE
);

CREATE TABLE Tasks (
    TaskID SERIAL PRIMARY KEY,
    TaskName VARCHAR(100) NOT NULL,
    AssignedTo INT,
    ProjectID INT,
    FOREIGN KEY (AssignedTo) REFERENCES Employees(EmployeeID) ON DELETE SET NULL,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID) ON DELETE CASCADE
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Отдел продаж'),
(2, 'Отдел маркетинга'),
(3, 'IT-отдел'),
(4, 'Отдел разработки'),
(5, 'Отдел поддержки');

INSERT INTO Roles (RoleID, RoleName) VALUES
(1, 'Менеджер'),
(2, 'Директор'),
(3, 'Генеральный директор'),
(4, 'Разработчик'),
(5, 'Специалист по поддержке'),
(6, 'Маркетолог');

INSERT INTO Employees (EmployeeID, Name, Position, ManagerID, DepartmentID, RoleID) VALUES
(1, 'Иван Иванов', 'Генеральный директор', NULL, 1, 3),
(2, 'Петр Петров', 'Директор по продажам', 1, 1, 2),
(3, 'Светлана Светлова', 'Директор по маркетингу', 1, 2, 2),
(4, 'Алексей Алексеев', 'Менеджер по продажам', 2, 1, 1),
(5, 'Мария Мариева', 'Менеджер по маркетингу', 3, 2, 1),
(6, 'Андрей Андреев', 'Разработчик', 1, 4, 4),
(7, 'Елена Еленова', 'Специалист по поддержке', 1, 5, 5),
(8, 'Олег Олегов', 'Менеджер по продукту', 2, 1, 1),
(9, 'Татьяна Татеева', 'Маркетолог', 3, 2, 6),
(10, 'Николай Николаев', 'Разработчик', 6, 4, 4),
(11, 'Ирина Иринина', 'Разработчик', 6, 4, 4),
(12, 'Сергей Сергеев', 'Специалист по поддержке', 7, 5, 5),
(13, 'Кристина Кристинина', 'Менеджер по продажам', 4, 1, 1),
(14, 'Дмитрий Дмитриев', 'Маркетолог', 3, 2, 6),
(15, 'Виктор Викторов', 'Менеджер по продажам', 4, 1, 1),
(16, 'Анастасия Анастасиева', 'Специалист по поддержке', 7, 5, 5),
(17, 'Максим Максимов', 'Разработчик', 6, 4, 4),
(18, 'Людмила Людмилова', 'Специалист по маркетингу', 3, 2, 6),
(19, 'Наталья Натальева', 'Менеджер по продажам', 4, 1, 1),
(20, 'Александр Александров', 'Менеджер по маркетингу', 3, 2, 1),
(21, 'Галина Галина', 'Специалист по поддержке', 7, 5, 5),
(22, 'Павел Павлов', 'Разработчик', 6, 4, 4),
(23, 'Марина Маринина', 'Специалист по маркетингу', 3, 2, 6),
(24, 'Станислав Станиславов', 'Менеджер по продажам', 4, 1, 1),
(25, 'Екатерина Екатеринина', 'Специалист по поддержке', 7, 5, 5),
(26, 'Денис Денисов', 'Разработчик', 6, 4, 4),
(27, 'Ольга Ольгина', 'Маркетолог', 3, 2, 6),
(28, 'Игорь Игорев', 'Менеджер по продукту', 2, 1, 1),
(29, 'Анастасия Анастасиевна', 'Специалист по поддержке', 7, 5, 5),
(30, 'Валентин Валентинов', 'Разработчик', 6, 4, 4);

INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, DepartmentID) VALUES
(1, 'Проект A', '2025-01-01', '2025-12-31', 1),
(2, 'Проект B', '2025-02-01', '2025-11-30', 2),
(3, 'Проект C', '2025-03-01', '2025-10-31', 4),
(4, 'Проект D', '2025-04-01', '2025-09-30', 5),
(5, 'Проект E', '2025-05-01', '2025-08-31', 3);

INSERT INTO Tasks (TaskID, TaskName, AssignedTo, ProjectID) VALUES
(1, 'Задача 1: Подготовка отчета по продажам', 4, 1),
(2, 'Задача 2: Анализ рынка', 9, 2),
(3, 'Задача 3: Разработка нового функционала', 10, 3),
(4, 'Задача 4: Поддержка клиентов', 12, 4),
(5, 'Задача 5: Создание рекламной кампании', 5, 2),
(6, 'Задача 6: Обновление документации', 6, 3),
(7, 'Задача 7: Проведение тренинга для сотрудников', 8, 1),
(8, 'Задача 8: Тестирование нового продукта', 11, 3),
(9, 'Задача 9: Ответы на запросы клиентов', 12, 4),
(10, 'Задача 10: Подготовка маркетинговых материалов', 9, 2),
(11, 'Задача 11: Интеграция с новым API', 10, 3),
(12, 'Задача 12: Настройка системы поддержки', 7, 5),
(13, 'Задача 13: Проведение анализа конкурентов', 9, 2),
(14, 'Задача 14: Создание презентации для клиентов', 4, 1),
(15, 'Задача 15: Обновление сайта', 6, 3);
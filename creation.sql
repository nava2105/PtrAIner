CREATE SCHEMA ptrainer;

CREATE TABLE ptrainer.muscles (
    MuscleID SERIAL PRIMARY KEY ,
    MuscleName VARCHAR(20) NOT NULL,
    MaintenanceVolume INT,
    EffectiveVolume INT,
    AdaptiveVolume INT,
    RecoverableVolume INT,
    WeeklyFrequency FLOAT,
    Repetitions INT,
    RepsInReserve INT
);

CREATE TABLE ptrainer.exercises (
    ExerciseID SERIAL PRIMARY KEY ,
    ExerciseName VARCHAR(50) NOT NULL
);

CREATE TABLE ptrainer.equipments (
    EquipmentID SERIAL PRIMARY KEY ,
    EquipmentName VARCHAR(20) NOT NULL
);

CREATE TABLE ptrainer.distributions (
    DistributionID SERIAL PRIMARY KEY ,
    DistributionName VARCHAR(25) NOT NULL
);

CREATE TABLE ptrainer.routines (
    RoutineID SERIAL PRIMARY KEY ,
    RoutineName VARCHAR(25)
);

CREATE TABLE ptrainer.muscle_exercise (
    MuscleID INT REFERENCES ptrainer.muscles(MuscleID) ON DELETE CASCADE,
    ExerciseID INT REFERENCES ptrainer.exercises(ExerciseID) ON DELETE CASCADE,
    Focus VARCHAR(10)
);

CREATE TABLE ptrainer.exercise_equipment (
    ExerciseID INT REFERENCES ptrainer.exercises(ExerciseID) ON DELETE CASCADE,
    EquipmentID INT REFERENCES ptrainer.equipments(EquipmentID) ON DELETE CASCADE
);

CREATE TABLE ptrainer.distribution_routine (
    DistributionID INT REFERENCES ptrainer.distributions(DistributionID) ON DELETE CASCADE,
    RoutineID INT REFERENCES ptrainer.routines(RoutineID) ON DELETE CASCADE
);

CREATE TABLE ptrainer.routine_muscle (
    RoutineID INT REFERENCES ptrainer.routines(RoutineID) ON DELETE CASCADE,
    MuscleID INT REFERENCES ptrainer.muscles(MuscleID) ON DELETE CASCADE
);

INSERT INTO ptrainer.muscles (MuscleName, MaintenanceVolume, EffectiveVolume, AdaptiveVolume, RecoverableVolume, WeeklyFrequency, Repetitions, RepsInReserve) VALUES
    ('quads', 6, 10, 16, 20, 2.25, 13, 2),
    ('hams', 4, 8, 13, 20, 2.5, 13, 2),
    ('glutes', 0, 2, 8, 16, 2.5, 13, 2),
    ('chest', 8, 11, 16, 22, 3, 13, 2),
    ('back', 8, 12, 18, 25, 3, 13, 2),
    ('delts', 3, 7, 19, 26, 4, 14, 1),
    ('rear delts', 3, 7, 19, 26, 4, 14, 1),
    ('front delts', 3, 7, 19, 26, 4, 14, 1),
    ('biceps', 3, 11, 17, 26, 4, 12, 1),
    ('triceps', 2, 8, 12, 18, 3, 19, 1),
    ('traps', 0, 7, 16, 26, 4, 19, 1),
    ('calves', 3, 10, 14, 20, 3, 19, 1),
    ('abs', 0, 8, 18, 25, 4, 19, 1),
    ('forearms', 0, 6, 12, 18, 3, 12, 1),
    ('abductor', 0, 5, 10, 14, 3, 10, 2);

INSERT INTO ptrainer.exercises (ExerciseName) VALUES
    ('sissy squat'),
    ('squat'),
    ('bulgarian split squat'),
    ('split stance deadlift'),
    ('standing calf raises'),
    ('inner abductor fly'),
    ('hip abductor fly'),
    ('concentration curl'),
    ('french press'),
    ('dips'),
    ('decline push-up'),
    ('push-up'),
    ('incline push-up'),
    ('military press'),
    ('lateral raises'),
    ('upright row'),
    ('front raise'),
    ('tricep kickback'),
    ('leg raises'),
    ('abs crunch'),
    ('pull up'),
    ('chin up'),
    ('low row'),
    ('lat push down'),
    ('face pull'),
    ('reverse fly'),
    ('shrug'),
    ('hammer curl'),
    ('reverse curl'),
    ('forearm curl'),
    ('bicep curl');

INSERT INTO ptrainer.equipments (EquipmentName) VALUES
    ('none'),
    ('high support'),
    ('dumbbells'),
    ('kettlebells'),
    ('barbell'),
    ('machine'),
    ('cable'),
    ('resistance band'),
    ('smith machine');

INSERT INTO ptrainer.distributions (DistributionName) VALUES
    ('push pull legs'),
    ('arnold split'),
    ('bro split'),
    ('upper lower'),
    ('total body');

INSERT INTO ptrainer.routines (RoutineName) VALUES
    ('ppl push'),
    ('ppl pull'),
    ('ppl legs'),
    ('arnold chest back'),
    ('arnold shoulders arms'),
    ('arnold legs'),
    ('bro chest'),
    ('bro back'),
    ('bro shoulders'),
    ('bro arms'),
    ('bro legs'),
    ('u-l push'),
    ('u-l pull'),
    ('total body');

INSERT INTO ptrainer.muscle_exercise (MuscleID, ExerciseID, Focus) VALUES
    (1, 1, 'main'),
    (1, 2, 'main'),
    (1, 3, 'secondary'),
    (2, 3, 'main'),
    (2, 4, 'main'),
    (3, 2, 'secondary'),
    (3, 3, 'secondary'),
    (3, 7, 'main'),
    (4, 11, 'main'),
    (4, 12, 'main'),
    (4, 13, 'main'),
    (5, 21, 'main'),
    (5, 22, 'main'),
    (5, 23, 'main'),
    (5, 24, 'main'),
    (5, 25, 'secondary'),
    (5, 26, 'secondary'),
    (6, 14, 'main'),
    (6, 15, 'main'),
    (6, 16, 'main'),
    (7, 25, 'main'),
    (7, 26, 'main'),
    (8, 17, 'main'),
    (9, 8, 'main'),
    (9, 22, 'secondary'),
    (9, 28, 'main'),
    (9, 31, 'main'),
    (10, 10, 'main'),
    (10, 11, 'secondary'),
    (10, 12, 'secondary'),
    (10, 13, 'secondary'),
    (10, 18, 'main'),
    (10, 9, 'main'),
    (11, 27, 'main'),
    (11, 26, 'secondary'),
    (12, 5, 'main'),
    (13, 19, 'main'),
    (13, 20, 'main'),
    (14, 28, 'secondary'),
    (14, 29, 'main'),
    (14, 30, 'main'),
    (15, 6, 'main');

INSERT INTO ptrainer.exercise_equipment (ExerciseID, EquipmentID) VALUES
    (1, 1),
    (2, 3),
    (2, 4),
    (2, 5),
    (2, 9),
    (3, 3),
    (3, 4),
    (4, 3),
    (4, 4),
    (5, 3),
    (5, 4),
    (5, 9),
    (6, 2),
    (6, 7),
    (7, 1),
    (6, 2),
    (8, 3),
    (9, 3),
    (9, 5),
    (9, 7),
    (10, 2),
    (11, 1),
    (12, 1),
    (13, 1),
    (14, 3),
    (14, 5),
    (14, 9),
    (15, 3),
    (15, 7),
    (15, 8),
    (16, 3),
    (16, 5),
    (16, 7),
    (17, 3),
    (17, 4),
    (17, 5),
    (17, 7),
    (17, 8),
    (18, 3),
    (18, 7),
    (18, 8),
    (19, 1),
    (20, 1),
    (21, 2),
    (22, 2),
    (23, 3),
    (23, 4),
    (23, 5),
    (24, 7),
    (24, 8),
    (25, 7),
    (25, 8),
    (26, 3),
    (26, 6),
    (26, 7),
    (27, 3),
    (27, 4),
    (27, 5),
    (27, 7),
    (27, 9),
    (28, 3),
    (29, 3),
    (29, 4),
    (29, 5),
    (29, 7),
    (30, 3),
    (30, 4),
    (30, 5),
    (30, 6),
    (31, 3),
    (31, 4),
    (31, 5),
    (31, 7);

INSERT INTO ptrainer.distribution_routine (DistributionID, RoutineID) VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (2, 5),
    (2, 6),
    (3, 7),
    (3, 8),
    (3, 9),
    (3, 10),
    (3, 11),
    (4, 12),
    (4, 13),
    (5, 14);

INSERT INTO ptrainer.routine_muscle (RoutineID, MuscleID) VALUES
    (1, 4),
    (1, 6),
    (1, 8),
    (1, 10),
    (2, 5),
    (2, 7),
    (2, 9),
    (2, 11),
    (2, 14),
    (3, 1),
    (3, 2),
    (3, 3),
    (3, 12),
    (3, 13),
    (3, 15),
    (4, 4),
    (4, 5),
    (4, 11),
    (5, 6),
    (5, 7),
    (5, 8),
    (5, 9),
    (5, 10),
    (5, 14),
    (6, 1),
    (6, 2),
    (6, 3),
    (6, 12),
    (6, 13),
    (6, 15),
    (7, 4),
    (7, 13),
    (8, 5),
    (8, 11),
    (9, 6),
    (9, 7),
    (9, 8),
    (10, 9),
    (10, 10),
    (10, 14),
    (11, 1),
    (11, 2),
    (11, 3),
    (11, 12),
    (11, 15),
    (12, 1),
    (12, 3),
    (12, 4),
    (12, 6),
    (12, 8),
    (12, 10),
    (12, 12),
    (13, 2),
    (13, 5),
    (13, 7),
    (13, 9),
    (13, 11),
    (13, 13),
    (13, 14),
    (13, 15),
    (14, 1),
    (14, 2),
    (14, 3),
    (14, 4),
    (14, 5),
    (14, 6),
    (14, 7),
    (14, 8),
    (14, 9),
    (14, 10),
    (14, 11),
    (14, 12),
    (14, 13),
    (14, 14),
    (14, 15);

-- SELECT e.ExerciseName, eq.EquipmentName
-- FROM ptrainer.muscle_exercise me
-- JOIN ptrainer.exercises e ON me.ExerciseID = e.ExerciseID
-- JOIN ptrainer.exercise_equipment ee ON e.ExerciseID = ee.ExerciseID
-- JOIN ptrainer.equipments eq ON ee.EquipmentID = eq.EquipmentID
-- JOIN ptrainer.muscles m ON me.MuscleID = m.MuscleID
-- WHERE m.MuscleName = 'biceps' AND me.Focus = 'main';

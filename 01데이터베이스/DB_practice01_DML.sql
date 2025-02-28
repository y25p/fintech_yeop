SELECT sex, age, name, s.passengerId FROM passenger p
INNER JOIN ticket t ON p.passengerId = t.passengerId
INNER JOIN survived s ON p.passengerId=s.passengerId

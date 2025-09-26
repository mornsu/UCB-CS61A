CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size FROM dogs, sizes WHERE height > min AND height <= max;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT c.name FROM dogs AS c, dogs AS p, parents WHERE c.name = child AND p.name = parent ORDER BY p.height DESC;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.child AS child1, b.child AS child2 FROM parents AS a, parents AS b
          WHERE a.parent = b.parent AND a.child < b.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, " || child1 || " plus " || child2 || " have the same size: " || a.size
  FROM siblings, size_of_dogs AS a, size_of_dogs AS b
  WHERE child1 = a.name AND child2 = b.name AND a.size = b.size;


module Main where

-- Attributes: ProjectID, Category, Score
type Project = (String, String, [Double])

projects :: [Project]
projects = 
  [ ("p1001", "rpg",    [90.0, 92.0, 88.0]),
    ("p1002", "puzzle", [67.0, 65.0, 69.0]),
    ("p1003", "puzzle", [89.0, 91.0, 87.0]),
    ("p1004", "fps",    [78.0, 80.0, 76.0]),
    ("p1005", "rpg",    [56.0, 54.0, 58.0]),
    ("p1006", "moba",   [34.0, 30.0, 38.0])
  ]

-- Total score using sum
totalScore :: [Double] -> Double
totalScore = sum

-- Calculate average score for a list of judge scores
avgScore :: [Double] -> Double
avgScore [] = 0.0
avgScore scores = totalScore scores / fromIntegral (length scores)

-- Using map to calculate the final aggregated average score for each project
calculateProjectAvg :: [Project] -> [(String, String, Double)]
calculateProjectAvg projectList = 
  map (\(pId, category, scores) -> (pId, category, avgScore scores)) projectList

-- Using filter to extract projects scoring above or equal 80
filterTopProjects :: [(String, String, Double)] -> [(String, String, Double)]
filterTopProjects projectList = 
  filter (\(_, _, score) -> score >= 80.0) projectList

-- Recursive function to find the winning project with high score using tuple
findWinProject :: [(String, String, Double)] -> (String, String, Double)
findWinProject [] = ("", "", 0.0)
findWinProject [singleProject] = singleProject
findWinProject ((pId, category, score):otherProject) =
  let (nextId, nextCategory, nextScore) = findWinProject otherProject
  in if score >= nextScore
       then (pId, category, score)
       else (nextId, nextCategory, nextScore)

-- Formatting
formatProject :: (String, String, Double) -> String
formatProject (pId, category, score) =
  "Project ID : " ++ pId ++ "\n" ++
  "Category   : " ++ category ++ "\n" ++
  "Avg Score  : " ++ show score ++ "\n"

main :: IO ()
main = do

  -- Calculate average scores for each project
  let projectAvg = calculateProjectAvg projects
  
  -- Filter
  let topProjects = filterTopProjects projectAvg
  
  -- Recursive
  let (winId, winCategory, winScore) = findWinProject projectAvg

  -- Display code
  
  putStrLn "---INNOVATION DAY SHOWCASE SYSTEM COMPETITION---"
  
  putStrLn "\nAll Projects & Averages:"
  mapM_ (putStrLn . formatProject) projectAvg

  putStrLn "Top Projects Details:"
  mapM_ (putStrLn . formatProject) topProjects

  putStrLn "Project Winner Details:"
  putStrLn ("Project ID : " ++ winId)
  putStrLn ("Category   : " ++ winCategory)
  putStrLn ("Score      : " ++ show winScore)
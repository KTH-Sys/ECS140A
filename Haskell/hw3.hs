-- HW3 - ECS140A
-- Kyaw Thi Ha

-- Part one
-- 1.
-- Without pattern matching
myremoveduplicates :: Eq a => [a] -> [a]
myremoveduplicates inlist
  | null inlist       = []
  | elem (head inlist) (tail inlist) = myremoveduplicates (tail inlist)
  | otherwise       = (head inlist) : myremoveduplicates (tail inlist)

-- With pattern matching
myremoveduplicates_pm :: Eq a => [a] -> [a]
myremoveduplicates_pm [] = []
myremoveduplicates_pm (x:xs)
  | elem x xs  = myremoveduplicates_pm xs
  | otherwise  = x : myremoveduplicates_pm xs

-- 2.
-- Without pattern matching
myintersection :: Eq a => [a] -> [a] -> [a]
myintersection list1 list2
  | null list1      = []
  | elem (head list1) list2 = (head list1) : myintersection (tail list1) list2
  | otherwise       = myintersection (tail list1) list2

-- With pattern matching
myintersection_pm :: Eq a => [a] -> [a] -> [a]
myintersection_pm [] _ = []
myintersection_pm (x:xs) list2
  | elem x list2  = x : myintersection_pm xs list2
  | otherwise     = myintersection_pm xs list2

--3.
-- Without pattern matching
mynthtail :: Int -> [a] -> [a]
mynthtail n list
  | n == 0    = list
  | null list     = []
  | otherwise = mynthtail (n - 1) (tail list)

-- With pattern matching
mynthtail_pm :: Int -> [a] -> [a]
mynthtail_pm 0 list = list
mynthtail_pm _ []   = []
mynthtail_pm n (_:xs) = mynthtail_pm (n - 1) xs

--4.
-- Without pattern matching
mylast :: [a] -> [a]
mylast list
  | null list           = []
  | null (tail list)    = list
  | otherwise           = mylast (tail list)

-- With pattern matching
mylast_pm :: [a] -> [a]
mylast_pm []       = []
mylast_pm [x]      = [x]
mylast_pm (_:xs)   = mylast_pm xs

--5.
-- Without pattern matching
myreverse :: [a] -> [a]
myreverse list = myrevHelper list []

myrevHelper :: [a] -> [a] -> [a]
myrevHelper list acc
  | null list = acc
  | otherwise = myrevHelper (tail list) (head list : acc)

-- With pattern matching
myreverse_pm :: [a] -> [a]
myreverse_pm list = myrevHelper_pm list []

myrevHelper_pm :: [a] -> [a] -> [a]
myrevHelper_pm [] acc = acc
myrevHelper_pm (x:xs) acc = myrevHelper_pm xs (x:acc)

--6.
-- Without pattern matching
myreplaceall :: Eq a => a -> a -> [a] -> [a]
myreplaceall new old list
  | null list = []
  | head list == old = new : myreplaceall new old (tail list)
  | otherwise = head list : myreplaceall new old (tail list)

-- With pattern matching
myreplaceall_pm :: Eq a => a -> a -> [a] -> [a]
myreplaceall_pm new old [] = []
myreplaceall_pm new old (x:xs)
  | x == old  = new : myreplaceall_pm new old xs
  | otherwise = x   : myreplaceall_pm new old xs

--7.
-- Without pattern matching
myordered :: Ord a => [a] -> Bool
myordered list
  | null list = True
  | null (tail list) = True
  | head list <= head (tail list)
      = myordered (tail list)
  | otherwise = False

-- With pattern matching
myordered_pm :: Ord a => [a] -> Bool
myordered_pm [] = True
myordered_pm [x] = True
myordered_pm (x:y:xs)
  | x <= y    = myordered_pm (y:xs)
  | otherwise = False

--Part Two
-- Using guards
calc :: String -> Double -> Double -> Double
calc op x y
  | op == "add"            = x + y
  | op == "sub"            = x - y
  | op == "mul"            = x * y
  | op == "div" && y == 0  = 0
  | op == "div"            = x / y
  | op == "pow"            = x ** y
  | otherwise              = 0

-- Using pattern matching
calc_pm :: String -> Double -> Double -> Double
calc_pm "add" x y = x + y
calc_pm "sub" x y = x - y
calc_pm "mul" x y = x * y
calc_pm "div" _ 0 = 0
calc_pm "div" x y = x / y
calc_pm "pow" x y = x ** y
calc_pm _     _ _ = 0

--Part Three
-- Pairwise Operations
listPairwise :: String -> [Double] -> [Double]
listPairwise _ [] = []
listPairwise _ [_] = []
listPairwise op (x:y:xs) =
    calc op x y : listPairwise op (y:xs)

-- Running Total
runningTotal :: [Double] -> [Double]
runningTotal list = runningHelper list 0

runningHelper :: [Double] -> Double -> [Double]
runningHelper [] _ = []
runningHelper (x:xs) acc =
    calc "add" acc x : runningHelper xs (calc "add" acc x)

--Part Four
type Operation = (String, Double, Double)

--evaluateOp
evaluateOp :: Operation -> Double
evaluateOp (op, x, y) = calc op x y

--evaluateAll
evaluateAll :: [Operation] -> [Double]
evaluateAll [] = []
evaluateAll (op:ops) = evaluateOp op : evaluateAll ops

--filterByResult
filterByResult :: (Double -> Bool) -> [Operation] -> [Operation]
filterByResult _ [] = []
filterByResult f (op:ops)
  | f (evaluateOp op) = op : filterByResult f ops
  | otherwise         = filterByResult f ops

--Part Five
-- powers
powers :: Double -> [Double]
powers b = powersHelper b b

powersHelper :: Double -> Double -> [Double]
powersHelper base current =
  current : powersHelper base (calc "mul" current base)


-- factorials
factorials :: [Double]
factorials = factorialsHelper 1 1

factorialsHelper :: Double -> Double -> [Double]
factorialsHelper n acc =
  acc : factorialsHelper (calc "add" n 1)
                         (calc "mul" acc (calc "add" n 1))


-- combineSeqs
combineSeqs :: String -> [Double] -> [Double] -> [Double]
combineSeqs _ [] _ = []
combineSeqs _ _ [] = []
combineSeqs op (x:xs) (y:ys) =
  calc op x y : combineSeqs op xs ys

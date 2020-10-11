{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

-- {-# LANGUAGE TemplateHaskell #-}
-- {-# LANGUAGE InstanceSigs #-}
-- {-# LANGUAGE ImpredicativeTypes #-}
-- {-# LANGUAGE LiberalTypeSynonyms #-}

-- {-# OPTIONS_GHC -ddump-simpl #-}

{-# OPTIONS_GHC -Wno-unused-imports #-}
module Main where

#define LENS 1
#define POSITION 0

#define GENERIC 1

#define LABEL 1
#define USE_TH 0

#define MULTIPLE 0

#define OPTIC Lens'
#define xfield gfield

#define xctor gconstructor
#define xposition gposition

import GHC.Generics (Generic)
import Optics.Core
import Data.Generics.Product.Fields
import Data.Generics.Product.Positions
import Data.Generics.Sum.Constructors
import qualified Data.Generics.Optics.Lite as L
import Optics.TH

import GHC.TypeLits
import Data.Typeable

{-

1 constructor

|variant   |memory |time  |
|----------|-------|------|
|gfield    |296M   |1.95s |
|field'    |342M   |2.91s |
|field     |329M   |3.37s |
|L.field   |1085M  |14.88s|
|          |       |      |
|gposition |304M   |2.05s |
|position' |1406M  |26.17s|
|position  |1022M  |66.01s|

2 constructors

|variant   |memory |time  |
|----------|-------|------|
|gfield    |415M   |3.71s |
|field'    |544M   |5.97s |
|field     |592M   |6.69s |
|L.field   |1359M  |25.77s|
|          |       |      |
|gposition |406M   |3.90s |
|position' |2208M  |32.67s|
|position  |2993M  |73.46s|

3 constructors

|variant   |memory |time  |
|----------|-------|------|
|gfield    |514M   |4.51s |
|field'    |714M   |7.75s |
|field     |827M   |9.07s |
|L.field   |1959M  |35.18s|
|          |       |      |
|gposition |507M   |4.81s |
|position' |2602M  |50.10s|
|position  |3848M  |108.9s|

-}
{-
data X a b = X { firstName :: a, lastName :: a } deriving (Show, Generic)
-- o
xxx :: Lens (X a b) (X a b') a a
xxx = gfield @"firstName"

data Y a b = Y1 { name :: a } | Y2 { age :: Int } deriving (Show, Generic)

yyy :: AffineTraversal (Y a b) (Y a' b') a a'
yyy = gafield @"name"

data C a b = C1 String a Int | C2 b deriving (Show, Generic)

c1 :: Prism (C a b) _ _ _
c1 = gconstructor @"C1"
-}
{-

-O0

-- gfield

|multiple|memory|time |
|--------|------|-----|
|0       |214M  |0.92s|
|1       |300M  |1.44s|
|2       |304M  |1.66s|
|3       |328M  |2.13s|

-- field'

|multiple|memory|time |
|--------|------|-----|
|0       |302M  |1.26s|
|1       |318M  |1.67s|
|2       |363M  |1.98s|
|3       |534M  |2.50s|

----------------------------------------

-O

-- gfield

|multiple|memory|time |
|--------|------|-----|
|0       |254M  |1.83s|
|1       |377M  |3.57s|
|2       |466M  |4.24s|
|3       |667M  |5.55s|

-- field'

|multiple|memory|time |
|--------|------|-----|
|0       |316M  |2.96s|
|1       |524M  |5.95s|
|2       |677M  |7.71s|
|3       |889M  |9.97s|

-- gconstructor

|memory|time |
|------|-----|
|309M  |3.00s|

-- _Ctor'

|memory|time |
|------|-----|
|386M  |3.76s|

-}

main :: IO ()
main = pure ()


----------------------------------------

#if LENS == 1

data T0 = T0
  { t0_f0 :: Int
  , t0_f1 :: Int
  , t0_f2 :: Int
  , t0_f3 :: Int
  , t0_f4 :: Int
  , t0_f5 :: Int
  , t0_f6 :: Int
  , t0_f7 :: Int
  , t0_f8 :: Int
  , t0_f9 :: Int
  }
#if MULTIPLE >= 1
  | T01 { t0_f0 :: Int
        , t0_f1 :: Int
        , t0_f2 :: Int
        , t0_f3 :: Int
        , t0_f4 :: Int
        , t0_f5 :: Int
        , t0_f6 :: Int
        , t0_f7 :: Int
        , t0_f8 :: Int
        , t0_f9 :: Int
        }
#endif
#if MULTIPLE >= 2
  | T02 { t0_f0 :: Int
        , t0_f1 :: Int
        , t0_f2 :: Int
        , t0_f3 :: Int
        , t0_f4 :: Int
        , t0_f5 :: Int
        , t0_f6 :: Int
        , t0_f7 :: Int
        , t0_f8 :: Int
        , t0_f9 :: Int
        }
#endif
#if MULTIPLE >= 3
  | T03 { t0_f0 :: Int
        , t0_f1 :: Int
        , t0_f2 :: Int
        , t0_f3 :: Int
        , t0_f4 :: Int
        , t0_f5 :: Int
        , t0_f6 :: Int
        , t0_f7 :: Int
        , t0_f8 :: Int
        , t0_f9 :: Int
        }
#endif
#if GENERIC == 1
  deriving Generic
#endif

data T1 = T1
  { t1_f0 :: Int
  , t1_f1 :: Int
  , t1_f2 :: Int
  , t1_f3 :: Int
  , t1_f4 :: Int
  , t1_f5 :: Int
  , t1_f6 :: Int
  , t1_f7 :: Int
  , t1_f8 :: Int
  , t1_f9 :: Int
  }
#if MULTIPLE >= 1
  | T11 { t1_f0 :: Int
        , t1_f1 :: Int
        , t1_f2 :: Int
        , t1_f3 :: Int
        , t1_f4 :: Int
        , t1_f5 :: Int
        , t1_f6 :: Int
        , t1_f7 :: Int
        , t1_f8 :: Int
        , t1_f9 :: Int
        }
#endif
#if MULTIPLE >= 2
  | T12 { t1_f0 :: Int
        , t1_f1 :: Int
        , t1_f2 :: Int
        , t1_f3 :: Int
        , t1_f4 :: Int
        , t1_f5 :: Int
        , t1_f6 :: Int
        , t1_f7 :: Int
        , t1_f8 :: Int
        , t1_f9 :: Int
        }
#endif
#if MULTIPLE >= 3
  | T13 { t1_f0 :: Int
        , t1_f1 :: Int
        , t1_f2 :: Int
        , t1_f3 :: Int
        , t1_f4 :: Int
        , t1_f5 :: Int
        , t1_f6 :: Int
        , t1_f7 :: Int
        , t1_f8 :: Int
        , t1_f9 :: Int
        }
#endif
#if GENERIC == 1
  deriving Generic
#endif

data T2 = T2
  { t2_f0 :: Int
  , t2_f1 :: Int
  , t2_f2 :: Int
  , t2_f3 :: Int
  , t2_f4 :: Int
  , t2_f5 :: Int
  , t2_f6 :: Int
  , t2_f7 :: Int
  , t2_f8 :: Int
   , t2_f9 :: Int
  }
#if MULTIPLE >= 1
  | T21 { t2_f0 :: Int
        , t2_f1 :: Int
        , t2_f2 :: Int
        , t2_f3 :: Int
        , t2_f4 :: Int
        , t2_f5 :: Int
        , t2_f6 :: Int
        , t2_f7 :: Int
        , t2_f8 :: Int
        , t2_f9 :: Int
        }
#endif
#if MULTIPLE >= 2
  | T22 { t2_f0 :: Int
        , t2_f1 :: Int
        , t2_f2 :: Int
        , t2_f3 :: Int
        , t2_f4 :: Int
        , t2_f5 :: Int
        , t2_f6 :: Int
        , t2_f7 :: Int
        , t2_f8 :: Int
        , t2_f9 :: Int
        }
#endif
#if MULTIPLE >= 3
  | T23 { t2_f0 :: Int
        , t2_f1 :: Int
        , t2_f2 :: Int
        , t2_f3 :: Int
        , t2_f4 :: Int
        , t2_f5 :: Int
        , t2_f6 :: Int
        , t2_f7 :: Int
        , t2_f8 :: Int
        , t2_f9 :: Int
        }
#endif
#if GENERIC == 1
  deriving Generic
#endif

data T3 = T3
  { t3_f0 :: Int
  , t3_f1 :: Int
  , t3_f2 :: Int
  , t3_f3 :: Int
  , t3_f4 :: Int
  , t3_f5 :: Int
  , t3_f6 :: Int
  , t3_f7 :: Int
  , t3_f8 :: Int
  , t3_f9 :: Int
  }
#if MULTIPLE >= 1
  | T31 { t3_f0 :: Int
        , t3_f1 :: Int
        , t3_f2 :: Int
        , t3_f3 :: Int
        , t3_f4 :: Int
        , t3_f5 :: Int
        , t3_f6 :: Int
        , t3_f7 :: Int
        , t3_f8 :: Int
        , t3_f9 :: Int
        }
#endif
#if MULTIPLE >= 2
  | T32 { t3_f0 :: Int
        , t3_f1 :: Int
        , t3_f2 :: Int
        , t3_f3 :: Int
        , t3_f4 :: Int
        , t3_f5 :: Int
        , t3_f6 :: Int
        , t3_f7 :: Int
        , t3_f8 :: Int
        , t3_f9 :: Int
        }
#endif
#if MULTIPLE >= 3
  | T33 { t3_f0 :: Int
        , t3_f1 :: Int
        , t3_f2 :: Int
        , t3_f3 :: Int
        , t3_f4 :: Int
        , t3_f5 :: Int
        , t3_f6 :: Int
        , t3_f7 :: Int
        , t3_f8 :: Int
        , t3_f9 :: Int
        }
#endif
#if GENERIC == 1
  deriving Generic
#endif

data T4 = T4
  { t4_f0 :: Int
  , t4_f1 :: Int
  , t4_f2 :: Int
  , t4_f3 :: Int
  , t4_f4 :: Int
  , t4_f5 :: Int
  , t4_f6 :: Int
  , t4_f7 :: Int
  , t4_f8 :: Int
  , t4_f9 :: Int
  }
#if MULTIPLE >= 1
  | T41 { t4_f0 :: Int
        , t4_f1 :: Int
        , t4_f2 :: Int
        , t4_f3 :: Int
        , t4_f4 :: Int
        , t4_f5 :: Int
        , t4_f6 :: Int
        , t4_f7 :: Int
        , t4_f8 :: Int
        , t4_f9 :: Int
        }
#endif
#if MULTIPLE >= 2
  | T42 { t4_f0 :: Int
        , t4_f1 :: Int
        , t4_f2 :: Int
        , t4_f3 :: Int
        , t4_f4 :: Int
        , t4_f5 :: Int
        , t4_f6 :: Int
        , t4_f7 :: Int
        , t4_f8 :: Int
        , t4_f9 :: Int
        }
#endif
#if MULTIPLE >= 3
  | T43 { t4_f0 :: Int
        , t4_f1 :: Int
        , t4_f2 :: Int
        , t4_f3 :: Int
        , t4_f4 :: Int
        , t4_f5 :: Int
        , t4_f6 :: Int
        , t4_f7 :: Int
        , t4_f8 :: Int
        , t4_f9 :: Int
        }
#endif
#if GENERIC == 1
  deriving Generic
#endif

data T5 = T5
  { t5_f0 :: Int
  , t5_f1 :: Int
  , t5_f2 :: Int
  , t5_f3 :: Int
  , t5_f4 :: Int
  , t5_f5 :: Int
  , t5_f6 :: Int
  , t5_f7 :: Int
  , t5_f8 :: Int
  , t5_f9 :: Int
  }
#if MULTIPLE >= 1
  | T51 { t5_f0 :: Int
        , t5_f1 :: Int
        , t5_f2 :: Int
        , t5_f3 :: Int
        , t5_f4 :: Int
        , t5_f5 :: Int
        , t5_f6 :: Int
        , t5_f7 :: Int
        , t5_f8 :: Int
        , t5_f9 :: Int
        }
#endif
#if MULTIPLE >= 2
  | T52 { t5_f0 :: Int
        , t5_f1 :: Int
        , t5_f2 :: Int
        , t5_f3 :: Int
        , t5_f4 :: Int
        , t5_f5 :: Int
        , t5_f6 :: Int
        , t5_f7 :: Int
        , t5_f8 :: Int
        , t5_f9 :: Int
        }
#endif
#if MULTIPLE >= 3
  | T53 { t5_f0 :: Int
        , t5_f1 :: Int
        , t5_f2 :: Int
        , t5_f3 :: Int
        , t5_f4 :: Int
        , t5_f5 :: Int
        , t5_f6 :: Int
        , t5_f7 :: Int
        , t5_f8 :: Int
        , t5_f9 :: Int
        }
#endif
#if GENERIC == 1
  deriving Generic
#endif

#if LABEL == 0

#if POSITION == 0

x_t0_f0 :: OPTIC T0 Int
x_t0_f0 = xfield @"t0_f0"

x_t0_f1 :: OPTIC T0 Int
x_t0_f1 = xfield @"t0_f1"

x_t0_f2 :: OPTIC T0 Int
x_t0_f2 = xfield @"t0_f2"

x_t0_f3 :: OPTIC T0 Int
x_t0_f3 = xfield @"t0_f3"

x_t0_f4 :: OPTIC T0 Int
x_t0_f4 = xfield @"t0_f4"

x_t0_f5 :: OPTIC T0 Int
x_t0_f5 = xfield @"t0_f5"

x_t0_f6 :: OPTIC T0 Int
x_t0_f6 = xfield @"t0_f6"

x_t0_f7 :: OPTIC T0 Int
x_t0_f7 = xfield @"t0_f7"

x_t0_f8 :: OPTIC T0 Int
x_t0_f8 = xfield @"t0_f8"

x_t0_f9 :: OPTIC T0 Int
x_t0_f9 = xfield @"t0_f9"

----

x_t1_f0 :: OPTIC T1 Int
x_t1_f0 = xfield @"t1_f0"

x_t1_f1 :: OPTIC T1 Int
x_t1_f1 = xfield @"t1_f1"

x_t1_f2 :: OPTIC T1 Int
x_t1_f2 = xfield @"t1_f2"

x_t1_f3 :: OPTIC T1 Int
x_t1_f3 = xfield @"t1_f3"

x_t1_f4 :: OPTIC T1 Int
x_t1_f4 = xfield @"t1_f4"

x_t1_f5 :: OPTIC T1 Int
x_t1_f5 = xfield @"t1_f5"

x_t1_f6 :: OPTIC T1 Int
x_t1_f6 = xfield @"t1_f6"

x_t1_f7 :: OPTIC T1 Int
x_t1_f7 = xfield @"t1_f7"

x_t1_f8 :: OPTIC T1 Int
x_t1_f8 = xfield @"t1_f8"

x_t1_f9 :: OPTIC T1 Int
x_t1_f9 = xfield @"t1_f9"

----

x_t2_f0 :: OPTIC T2 Int
x_t2_f0 = xfield @"t2_f0"

x_t2_f1 :: OPTIC T2 Int
x_t2_f1 = xfield @"t2_f1"

x_t2_f2 :: OPTIC T2 Int
x_t2_f2 = xfield @"t2_f2"

x_t2_f3 :: OPTIC T2 Int
x_t2_f3 = xfield @"t2_f3"

x_t2_f4 :: OPTIC T2 Int
x_t2_f4 = xfield @"t2_f4"

x_t2_f5 :: OPTIC T2 Int
x_t2_f5 = xfield @"t2_f5"

x_t2_f6 :: OPTIC T2 Int
x_t2_f6 = xfield @"t2_f6"

x_t2_f7 :: OPTIC T2 Int
x_t2_f7 = xfield @"t2_f7"

x_t2_f8 :: OPTIC T2 Int
x_t2_f8 = xfield @"t2_f8"

x_t2_f9 :: OPTIC T2 Int
x_t2_f9 = xfield @"t2_f9"

----

x_t3_f0 :: OPTIC T3 Int
x_t3_f0 = xfield @"t3_f0"

x_t3_f1 :: OPTIC T3 Int
x_t3_f1 = xfield @"t3_f1"

x_t3_f2 :: OPTIC T3 Int
x_t3_f2 = xfield @"t3_f2"

x_t3_f3 :: OPTIC T3 Int
x_t3_f3 = xfield @"t3_f3"

x_t3_f4 :: OPTIC T3 Int
x_t3_f4 = xfield @"t3_f4"

x_t3_f5 :: OPTIC T3 Int
x_t3_f5 = xfield @"t3_f5"

x_t3_f6 :: OPTIC T3 Int
x_t3_f6 = xfield @"t3_f6"

x_t3_f7 :: OPTIC T3 Int
x_t3_f7 = xfield @"t3_f7"

x_t3_f8 :: OPTIC T3 Int
x_t3_f8 = xfield @"t3_f8"

x_t3_f9 :: OPTIC T3 Int
x_t3_f9 = xfield @"t3_f9"

----

x_t4_f0 :: OPTIC T4 Int
x_t4_f0 = xfield @"t4_f0"

x_t4_f1 :: OPTIC T4 Int
x_t4_f1 = xfield @"t4_f1"

x_t4_f2 :: OPTIC T4 Int
x_t4_f2 = xfield @"t4_f2"

x_t4_f3 :: OPTIC T4 Int
x_t4_f3 = xfield @"t4_f3"

x_t4_f4 :: OPTIC T4 Int
x_t4_f4 = xfield @"t4_f4"

x_t4_f5 :: OPTIC T4 Int
x_t4_f5 = xfield @"t4_f5"

x_t4_f6 :: OPTIC T4 Int
x_t4_f6 = xfield @"t4_f6"

x_t4_f7 :: OPTIC T4 Int
x_t4_f7 = xfield @"t4_f7"

x_t4_f8 :: OPTIC T4 Int
x_t4_f8 = xfield @"t4_f8"

x_t4_f9 :: OPTIC T4 Int
x_t4_f9 = xfield @"t4_f9"

----

x_t5_f0 :: OPTIC T5 Int
x_t5_f0 = xfield @"t5_f0"

x_t5_f1 :: OPTIC T5 Int
x_t5_f1 = xfield @"t5_f1"

x_t5_f2 :: OPTIC T5 Int
x_t5_f2 = xfield @"t5_f2"

x_t5_f3 :: OPTIC T5 Int
x_t5_f3 = xfield @"t5_f3"

x_t5_f4 :: OPTIC T5 Int
x_t5_f4 = xfield @"t5_f4"

x_t5_f5 :: OPTIC T5 Int
x_t5_f5 = xfield @"t5_f5"

x_t5_f6 :: OPTIC T5 Int
x_t5_f6 = xfield @"t5_f6"

x_t5_f7 :: OPTIC T5 Int
x_t5_f7 = xfield @"t5_f7"

x_t5_f8 :: OPTIC T5 Int
x_t5_f8 = xfield @"t5_f8"

x_t5_f9 :: OPTIC T5 Int
x_t5_f9 = xfield @"t5_f9"

#else

x_t0_f0 :: Lens' T0 Int
x_t0_f0 = xposition @1

x_t0_f1 :: Lens' T0 Int
x_t0_f1 = xposition @2

x_t0_f2 :: Lens' T0 Int
x_t0_f2 = xposition @3

x_t0_f3 :: Lens' T0 Int
x_t0_f3 = xposition @4

x_t0_f4 :: Lens' T0 Int
x_t0_f4 = xposition @5

x_t0_f5 :: Lens' T0 Int
x_t0_f5 = xposition @6

x_t0_f6 :: Lens' T0 Int
x_t0_f6 = xposition @7

x_t0_f7 :: Lens' T0 Int
x_t0_f7 = xposition @8

x_t0_f8 :: Lens' T0 Int
x_t0_f8 = xposition @9

x_t0_f9 :: Lens' T0 Int
x_t0_f9 = xposition @10

----

x_t1_f0 :: Lens' T1 Int
x_t1_f0 = xposition @1

x_t1_f1 :: Lens' T1 Int
x_t1_f1 = xposition @2

x_t1_f2 :: Lens' T1 Int
x_t1_f2 = xposition @3

x_t1_f3 :: Lens' T1 Int
x_t1_f3 = xposition @4

x_t1_f4 :: Lens' T1 Int
x_t1_f4 = xposition @5

x_t1_f5 :: Lens' T1 Int
x_t1_f5 = xposition @6

x_t1_f6 :: Lens' T1 Int
x_t1_f6 = xposition @7

x_t1_f7 :: Lens' T1 Int
x_t1_f7 = xposition @8

x_t1_f8 :: Lens' T1 Int
x_t1_f8 = xposition @9

x_t1_f9 :: Lens' T1 Int
x_t1_f9 = xposition @10

----

x_t2_f0 :: Lens' T2 Int
x_t2_f0 = xposition @1

x_t2_f1 :: Lens' T2 Int
x_t2_f1 = xposition @2

x_t2_f2 :: Lens' T2 Int
x_t2_f2 = xposition @3

x_t2_f3 :: Lens' T2 Int
x_t2_f3 = xposition @4

x_t2_f4 :: Lens' T2 Int
x_t2_f4 = xposition @5

x_t2_f5 :: Lens' T2 Int
x_t2_f5 = xposition @6

x_t2_f6 :: Lens' T2 Int
x_t2_f6 = xposition @7

x_t2_f7 :: Lens' T2 Int
x_t2_f7 = xposition @8

x_t2_f8 :: Lens' T2 Int
x_t2_f8 = xposition @9

x_t2_f9 :: Lens' T2 Int
x_t2_f9 = xposition @10

----

x_t3_f0 :: Lens' T3 Int
x_t3_f0 = xposition @1

x_t3_f1 :: Lens' T3 Int
x_t3_f1 = xposition @2

x_t3_f2 :: Lens' T3 Int
x_t3_f2 = xposition @3

x_t3_f3 :: Lens' T3 Int
x_t3_f3 = xposition @4

x_t3_f4 :: Lens' T3 Int
x_t3_f4 = xposition @5

x_t3_f5 :: Lens' T3 Int
x_t3_f5 = xposition @6

x_t3_f6 :: Lens' T3 Int
x_t3_f6 = xposition @7

x_t3_f7 :: Lens' T3 Int
x_t3_f7 = xposition @8

x_t3_f8 :: Lens' T3 Int
x_t3_f8 = xposition @9

x_t3_f9 :: Lens' T3 Int
x_t3_f9 = xposition @10

----

x_t4_f0 :: Lens' T4 Int
x_t4_f0 = xposition @1

x_t4_f1 :: Lens' T4 Int
x_t4_f1 = xposition @2

x_t4_f2 :: Lens' T4 Int
x_t4_f2 = xposition @3

x_t4_f3 :: Lens' T4 Int
x_t4_f3 = xposition @4

x_t4_f4 :: Lens' T4 Int
x_t4_f4 = xposition @5

x_t4_f5 :: Lens' T4 Int
x_t4_f5 = xposition @6

x_t4_f6 :: Lens' T4 Int
x_t4_f6 = xposition @7

x_t4_f7 :: Lens' T4 Int
x_t4_f7 = xposition @8

x_t4_f8 :: Lens' T4 Int
x_t4_f8 = xposition @9

x_t4_f9 :: Lens' T4 Int
x_t4_f9 = xposition @10

----

x_t5_f0 :: Lens' T5 Int
x_t5_f0 = xposition @1

x_t5_f1 :: Lens' T5 Int
x_t5_f1 = xposition @2

x_t5_f2 :: Lens' T5 Int
x_t5_f2 = xposition @3

x_t5_f3 :: Lens' T5 Int
x_t5_f3 = xposition @4

x_t5_f4 :: Lens' T5 Int
x_t5_f4 = xposition @5

x_t5_f5 :: Lens' T5 Int
x_t5_f5 = xposition @6

x_t5_f6 :: Lens' T5 Int
x_t5_f6 = xposition @7

x_t5_f7 :: Lens' T5 Int
x_t5_f7 = xposition @8

x_t5_f8 :: Lens' T5 Int
x_t5_f8 = xposition @9

x_t5_f9 :: Lens' T5 Int
x_t5_f9 = xposition @10

#endif

#else

#if USE_TH == 1
makeFieldLabelsWith noPrefixFieldLabels ''T0
makeFieldLabelsWith noPrefixFieldLabels ''T1
makeFieldLabelsWith noPrefixFieldLabels ''T2
makeFieldLabelsWith noPrefixFieldLabels ''T3
makeFieldLabelsWith noPrefixFieldLabels ''T4
makeFieldLabelsWith noPrefixFieldLabels ''T5
#endif

#if POSITION == 0

x_t0_f0 :: Lens' T0 Int
x_t0_f0 = #t0_f0

x_t0_f1 :: Lens' T0 Int
x_t0_f1 = #t0_f1

x_t0_f2 :: Lens' T0 Int
x_t0_f2 = #t0_f2

x_t0_f3 :: Lens' T0 Int
x_t0_f3 = #t0_f3

x_t0_f4 :: Lens' T0 Int
x_t0_f4 = #t0_f4

x_t0_f5 :: Lens' T0 Int
x_t0_f5 = #t0_f5

x_t0_f6 :: Lens' T0 Int
x_t0_f6 = #t0_f6

x_t0_f7 :: Lens' T0 Int
x_t0_f7 = #t0_f7

x_t0_f8 :: Lens' T0 Int
x_t0_f8 = #t0_f8

x_t0_f9 :: Lens' T0 Int
x_t0_f9 = #t0_f9

----

x_t1_f0 :: Lens' T1 Int
x_t1_f0 = #t1_f0

x_t1_f1 :: Lens' T1 Int
x_t1_f1 = #t1_f1

x_t1_f2 :: Lens' T1 Int
x_t1_f2 = #t1_f2

x_t1_f3 :: Lens' T1 Int
x_t1_f3 = #t1_f3

x_t1_f4 :: Lens' T1 Int
x_t1_f4 = #t1_f4

x_t1_f5 :: Lens' T1 Int
x_t1_f5 = #t1_f5

x_t1_f6 :: Lens' T1 Int
x_t1_f6 = #t1_f6

x_t1_f7 :: Lens' T1 Int
x_t1_f7 = #t1_f7

x_t1_f8 :: Lens' T1 Int
x_t1_f8 = #t1_f8

x_t1_f9 :: Lens' T1 Int
x_t1_f9 = #t1_f9

----

x_t2_f0 :: Lens' T2 Int
x_t2_f0 = #t2_f0

x_t2_f1 :: Lens' T2 Int
x_t2_f1 = #t2_f1

x_t2_f2 :: Lens' T2 Int
x_t2_f2 = #t2_f2

x_t2_f3 :: Lens' T2 Int
x_t2_f3 = #t2_f3

x_t2_f4 :: Lens' T2 Int
x_t2_f4 = #t2_f4

x_t2_f5 :: Lens' T2 Int
x_t2_f5 = #t2_f5

x_t2_f6 :: Lens' T2 Int
x_t2_f6 = #t2_f6

x_t2_f7 :: Lens' T2 Int
x_t2_f7 = #t2_f7

x_t2_f8 :: Lens' T2 Int
x_t2_f8 = #t2_f8

x_t2_f9 :: Lens' T2 Int
x_t2_f9 = #t2_f9

----

x_t3_f0 :: Lens' T3 Int
x_t3_f0 = #t3_f0

x_t3_f1 :: Lens' T3 Int
x_t3_f1 = #t3_f1

x_t3_f2 :: Lens' T3 Int
x_t3_f2 = #t3_f2

x_t3_f3 :: Lens' T3 Int
x_t3_f3 = #t3_f3

x_t3_f4 :: Lens' T3 Int
x_t3_f4 = #t3_f4

x_t3_f5 :: Lens' T3 Int
x_t3_f5 = #t3_f5

x_t3_f6 :: Lens' T3 Int
x_t3_f6 = #t3_f6

x_t3_f7 :: Lens' T3 Int
x_t3_f7 = #t3_f7

x_t3_f8 :: Lens' T3 Int
x_t3_f8 = #t3_f8

x_t3_f9 :: Lens' T3 Int
x_t3_f9 = #t3_f9

----

x_t4_f0 :: Lens' T4 Int
x_t4_f0 = #t4_f0

x_t4_f1 :: Lens' T4 Int
x_t4_f1 = #t4_f1

x_t4_f2 :: Lens' T4 Int
x_t4_f2 = #t4_f2

x_t4_f3 :: Lens' T4 Int
x_t4_f3 = #t4_f3

x_t4_f4 :: Lens' T4 Int
x_t4_f4 = #t4_f4

x_t4_f5 :: Lens' T4 Int
x_t4_f5 = #t4_f5

x_t4_f6 :: Lens' T4 Int
x_t4_f6 = #t4_f6

x_t4_f7 :: Lens' T4 Int
x_t4_f7 = #t4_f7

x_t4_f8 :: Lens' T4 Int
x_t4_f8 = #t4_f8

x_t4_f9 :: Lens' T4 Int
x_t4_f9 = #t4_f9

----

x_t5_f0 :: Lens' T5 Int
x_t5_f0 = #t5_f0

x_t5_f1 :: Lens' T5 Int
x_t5_f1 = #t5_f1

x_t5_f2 :: Lens' T5 Int
x_t5_f2 = #t5_f2

x_t5_f3 :: Lens' T5 Int
x_t5_f3 = #t5_f3

x_t5_f4 :: Lens' T5 Int
x_t5_f4 = #t5_f4

x_t5_f5 :: Lens' T5 Int
x_t5_f5 = #t5_f5

x_t5_f6 :: Lens' T5 Int
x_t5_f6 = #t5_f6

x_t5_f7 :: Lens' T5 Int
x_t5_f7 = #t5_f7

x_t5_f8 :: Lens' T5 Int
x_t5_f8 = #t5_f8

x_t5_f9 :: Lens' T5 Int
x_t5_f9 = #t5_f9

#else

x_t0_f0 :: Lens' T0 Int
x_t0_f0 = #_1

x_t0_f1 :: Lens' T0 Int
x_t0_f1 = #_2

x_t0_f2 :: Lens' T0 Int
x_t0_f2 = #_3

x_t0_f3 :: Lens' T0 Int
x_t0_f3 = #_4

x_t0_f4 :: Lens' T0 Int
x_t0_f4 = #_5

x_t0_f5 :: Lens' T0 Int
x_t0_f5 = #_6

x_t0_f6 :: Lens' T0 Int
x_t0_f6 = #_7

x_t0_f7 :: Lens' T0 Int
x_t0_f7 = #_8

x_t0_f8 :: Lens' T0 Int
x_t0_f8 = #_9

x_t0_f9 :: Lens' T0 Int
x_t0_f9 = #_10

----

x_t1_f0 :: Lens' T1 Int
x_t1_f0 = #_1

x_t1_f1 :: Lens' T1 Int
x_t1_f1 = #_2

x_t1_f2 :: Lens' T1 Int
x_t1_f2 = #_3

x_t1_f3 :: Lens' T1 Int
x_t1_f3 = #_4

x_t1_f4 :: Lens' T1 Int
x_t1_f4 = #_5

x_t1_f5 :: Lens' T1 Int
x_t1_f5 = #_6

x_t1_f6 :: Lens' T1 Int
x_t1_f6 = #_7

x_t1_f7 :: Lens' T1 Int
x_t1_f7 = #_8

x_t1_f8 :: Lens' T1 Int
x_t1_f8 = #_9

x_t1_f9 :: Lens' T1 Int
x_t1_f9 = #_10

----

x_t2_f0 :: Lens' T2 Int
x_t2_f0 = #_1

x_t2_f1 :: Lens' T2 Int
x_t2_f1 = #_2

x_t2_f2 :: Lens' T2 Int
x_t2_f2 = #_3

x_t2_f3 :: Lens' T2 Int
x_t2_f3 = #_4

x_t2_f4 :: Lens' T2 Int
x_t2_f4 = #_5

x_t2_f5 :: Lens' T2 Int
x_t2_f5 = #_6

x_t2_f6 :: Lens' T2 Int
x_t2_f6 = #_7

x_t2_f7 :: Lens' T2 Int
x_t2_f7 = #_8

x_t2_f8 :: Lens' T2 Int
x_t2_f8 = #_9

x_t2_f9 :: Lens' T2 Int
x_t2_f9 = #_10

----

x_t3_f0 :: Lens' T3 Int
x_t3_f0 = #_1

x_t3_f1 :: Lens' T3 Int
x_t3_f1 = #_2

x_t3_f2 :: Lens' T3 Int
x_t3_f2 = #_3

x_t3_f3 :: Lens' T3 Int
x_t3_f3 = #_4

x_t3_f4 :: Lens' T3 Int
x_t3_f4 = #_5

x_t3_f5 :: Lens' T3 Int
x_t3_f5 = #_6

x_t3_f6 :: Lens' T3 Int
x_t3_f6 = #_7

x_t3_f7 :: Lens' T3 Int
x_t3_f7 = #_8

x_t3_f8 :: Lens' T3 Int
x_t3_f8 = #_9

x_t3_f9 :: Lens' T3 Int
x_t3_f9 = #_10

----

x_t4_f0 :: Lens' T4 Int
x_t4_f0 = #_1

x_t4_f1 :: Lens' T4 Int
x_t4_f1 = #_2

x_t4_f2 :: Lens' T4 Int
x_t4_f2 = #_3

x_t4_f3 :: Lens' T4 Int
x_t4_f3 = #_4

x_t4_f4 :: Lens' T4 Int
x_t4_f4 = #_5

x_t4_f5 :: Lens' T4 Int
x_t4_f5 = #_6

x_t4_f6 :: Lens' T4 Int
x_t4_f6 = #_7

x_t4_f7 :: Lens' T4 Int
x_t4_f7 = #_8

x_t4_f8 :: Lens' T4 Int
x_t4_f8 = #_9

x_t4_f9 :: Lens' T4 Int
x_t4_f9 = #_10

----

x_t5_f0 :: Lens' T5 Int
x_t5_f0 = #_1

x_t5_f1 :: Lens' T5 Int
x_t5_f1 = #_2

x_t5_f2 :: Lens' T5 Int
x_t5_f2 = #_3

x_t5_f3 :: Lens' T5 Int
x_t5_f3 = #_4

x_t5_f4 :: Lens' T5 Int
x_t5_f4 = #_5

x_t5_f5 :: Lens' T5 Int
x_t5_f5 = #_6

x_t5_f6 :: Lens' T5 Int
x_t5_f6 = #_7

x_t5_f7 :: Lens' T5 Int
x_t5_f7 = #_8

x_t5_f8 :: Lens' T5 Int
x_t5_f8 = #_9

x_t5_f9 :: Lens' T5 Int
x_t5_f9 = #_10

#endif

#endif

#elif LENS == 0

data T1
  = T10 Int
  | T11 Int
  | T12 Int
  | T13 Int
  | T14 Int
  | T15 Int
  | T16 Int
  | T17 Int
  | T18 Int
  | T19 Int
#if GENERIC == 1
  deriving Generic
#endif

data T2
  = T20 Int
  | T21 Int
  | T22 Int
  | T23 Int
  | T24 Int
  | T25 Int
  | T26 Int
  | T27 Int
  | T28 Int
  | T29 Int
#if GENERIC == 1
  deriving Generic
#endif

data T3
  = T30 Int
  | T31 Int
  | T32 Int
  | T33 Int
  | T34 Int
  | T35 Int
  | T36 Int
  | T37 Int
  | T38 Int
  | T39 Int
#if GENERIC == 1
  deriving Generic
#endif

data T4
  = T40 Int Int Int
  | T41 Int Int Int
  | T42 Int Int Int
  | T43 Int Int Int
  | T44 Int Int Int
  | T45 Int Int Int
  | T46 Int Int Int
  | T47 Int Int Int
  | T48 Int Int Int
  | T49 Int Int Int
#if GENERIC == 1
  deriving Generic
#endif

data T5
  = T50 Int Int Int
  | T51 Int Int Int
  | T52 Int Int Int
  | T53 Int Int Int
  | T54 Int Int Int
  | T55 Int Int Int
  | T56 Int Int Int
  | T57 Int Int Int
  | T58 Int Int Int
  | T59 Int Int Int
#if GENERIC == 1
  deriving Generic
#endif

#if LABEL == 0

t_11 :: Prism' T1 Int
t_11 = xctor @"T11"

t_12 :: Prism' T1 Int
t_12 = xctor @"T12"

t_13 :: Prism' T1 Int
t_13 = xctor @"T13"

t_14 :: Prism' T1 Int
t_14 = xctor @"T14"

t_15 :: Prism' T1 Int
t_15 = xctor @"T15"

t_16 :: Prism' T1 Int
t_16 = xctor @"T16"

t_17 :: Prism' T1 Int
t_17 = xctor @"T17"

t_18 :: Prism' T1 Int
t_18 = xctor @"T18"

t_19 :: Prism' T1 Int
t_19 = xctor @"T19"

----------------------------------------

t_21 :: Prism' T2 Int
t_21 = xctor @"T21"

t_22 :: Prism' T2 Int
t_22 = xctor @"T22"

t_23 :: Prism' T2 Int
t_23 = xctor @"T23"

t_24 :: Prism' T2 Int
t_24 = xctor @"T24"

t_25 :: Prism' T2 Int
t_25 = xctor @"T25"

t_26 :: Prism' T2 Int
t_26 = xctor @"T26"

t_27 :: Prism' T2 Int
t_27 = xctor @"T27"

t_28 :: Prism' T2 Int
t_28 = xctor @"T28"

t_29 :: Prism' T2 Int
t_29 = xctor @"T29"

----------------------------------------

t_31 :: Prism' T3 Int
t_31 = xctor @"T31"

t_32 :: Prism' T3 Int
t_32 = xctor @"T32"

t_33 :: Prism' T3 Int
t_33 = xctor @"T33"

t_34 :: Prism' T3 Int
t_34 = xctor @"T34"

t_35 :: Prism' T3 Int
t_35 = xctor @"T35"

t_36 :: Prism' T3 Int
t_36 = xctor @"T36"

t_37 :: Prism' T3 Int
t_37 = xctor @"T37"

t_38 :: Prism' T3 Int
t_38 = xctor @"T38"

t_39 :: Prism' T3 Int
t_39 = xctor @"T39"

----------------------------------------

t_41 :: Prism' T4 (Int, Int, Int)
t_41 = xctor @"T41"

t_42 :: Prism' T4 (Int, Int, Int)
t_42 = xctor @"T42"

t_43 :: Prism' T4 (Int, Int, Int)
t_43 = xctor @"T43"

t_44 :: Prism' T4 (Int, Int, Int)
t_44 = xctor @"T44"

t_45 :: Prism' T4 (Int, Int, Int)
t_45 = xctor @"T45"

t_46 :: Prism' T4 (Int, Int, Int)
t_46 = xctor @"T46"

t_47 :: Prism' T4 (Int, Int, Int)
t_47 = xctor @"T47"

t_48 :: Prism' T4 (Int, Int, Int)
t_48 = xctor @"T48"

t_49 :: Prism' T4 (Int, Int, Int)
t_49 = xctor @"T49"

----------------------------------------

t_51 :: Prism' T5 (Int, Int, Int)
t_51 = xctor @"T51"

t_52 :: Prism' T5 (Int, Int, Int)
t_52 = xctor @"T52"

t_53 :: Prism' T5 (Int, Int, Int)
t_53 = xctor @"T53"

t_54 :: Prism' T5 (Int, Int, Int)
t_54 = xctor @"T54"

t_55 :: Prism' T5 (Int, Int, Int)
t_55 = xctor @"T55"

t_56 :: Prism' T5 (Int, Int, Int)
t_56 = xctor @"T56"

t_57 :: Prism' T5 (Int, Int, Int)
t_57 = xctor @"T57"

t_58 :: Prism' T5 (Int, Int, Int)
t_58 = xctor @"T58"

t_59 :: Prism' T5 (Int, Int, Int)
t_59 = xctor @"T59"

#else

#if USE_TH == 1
makePrismLabels ''T1
makePrismLabels ''T2
makePrismLabels ''T3
makePrismLabels ''T4
makePrismLabels ''T5
#endif

t_11 :: Prism' T1 Int
t_11 = #_T11

t_12 :: Prism' T1 Int
t_12 = #_T12

t_13 :: Prism' T1 Int
t_13 = #_T13

t_14 :: Prism' T1 Int
t_14 = #_T14

t_15 :: Prism' T1 Int
t_15 = #_T15

t_16 :: Prism' T1 Int
t_16 = #_T16

t_17 :: Prism' T1 Int
t_17 = #_T17

t_18 :: Prism' T1 Int
t_18 = #_T18

t_19 :: Prism' T1 Int
t_19 = #_T19

----------------------------------------

t_21 :: Prism' T2 Int
t_21 = #_T21

t_22 :: Prism' T2 Int
t_22 = #_T22

t_23 :: Prism' T2 Int
t_23 = #_T23

t_24 :: Prism' T2 Int
t_24 = #_T24

t_25 :: Prism' T2 Int
t_25 = #_T25

t_26 :: Prism' T2 Int
t_26 = #_T26

t_27 :: Prism' T2 Int
t_27 = #_T27

t_28 :: Prism' T2 Int
t_28 = #_T28

t_29 :: Prism' T2 Int
t_29 = #_T29

----------------------------------------

t_31 :: Prism' T3 Int
t_31 = #_T31

t_32 :: Prism' T3 Int
t_32 = #_T32

t_33 :: Prism' T3 Int
t_33 = #_T33

t_34 :: Prism' T3 Int
t_34 = #_T34

t_35 :: Prism' T3 Int
t_35 = #_T35

t_36 :: Prism' T3 Int
t_36 = #_T36

t_37 :: Prism' T3 Int
t_37 = #_T37

t_38 :: Prism' T3 Int
t_38 = #_T38

t_39 :: Prism' T3 Int
t_39 = #_T39

----------------------------------------

t_41 :: Prism' T4 (Int, Int, Int)
t_41 = #_T41

t_42 :: Prism' T4 (Int, Int, Int)
t_42 = #_T42

t_43 :: Prism' T4 (Int, Int, Int)
t_43 = #_T43

t_44 :: Prism' T4 (Int, Int, Int)
t_44 = #_T44

t_45 :: Prism' T4 (Int, Int, Int)
t_45 = #_T45

t_46 :: Prism' T4 (Int, Int, Int)
t_46 = #_T46

t_47 :: Prism' T4 (Int, Int, Int)
t_47 = #_T47

t_48 :: Prism' T4 (Int, Int, Int)
t_48 = #_T48

t_49 :: Prism' T4 (Int, Int, Int)
t_49 = #_T49

----------------------------------------

t_51 :: Prism' T5 (Int, Int, Int)
t_51 = #_T51

t_52 :: Prism' T5 (Int, Int, Int)
t_52 = #_T52

t_53 :: Prism' T5 (Int, Int, Int)
t_53 = #_T53

t_54 :: Prism' T5 (Int, Int, Int)
t_54 = #_T54

t_55 :: Prism' T5 (Int, Int, Int)
t_55 = #_T55

t_56 :: Prism' T5 (Int, Int, Int)
t_56 = #_T56

t_57 :: Prism' T5 (Int, Int, Int)
t_57 = #_T57

t_58 :: Prism' T5 (Int, Int, Int)
t_58 = #_T58

t_59 :: Prism' T5 (Int, Int, Int)
t_59 = #_T59

#endif

#endif

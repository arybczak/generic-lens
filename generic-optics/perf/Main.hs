{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
{-# OPTIONS_GHC -Wno-orphans -Wno-unused-imports #-}
module Main where

#define CONSTRUCTORS 1

#define xfield field'

import Data.Generics.Product
import Control.DeepSeq
import GHC.Generics
import Optics.Core
import Optics.TH

{-

8.10.1

|constructors|memory[M]|time[s]|
|------------|---------|-------|
|1           |974      |7.43   |
|2           |1382     |13.12  |
|3           |1611     |20.33  |
|4           |2934     |28.141 |

8.11.0

|constructors|memory[M]|time[s]|
|------------|---------|-------|
|1           |766      |6.85   |
|2           |1364     |13.05  |
|3           |2010     |30.92  |
|4           |3181     |48.89  |

-}

main :: IO ()
main = pure ()

data X = X1
  { x00 :: Int
  , x01 :: Int
  , x02 :: Int
  , x03 :: Int
  , x04 :: Int
  , x05 :: Int
  , x06 :: Int
  , x07 :: Int
  , x08 :: Int
  , x09 :: Int
  , x10 :: Int
  , x11 :: Int
  , x12 :: Int
  , x13 :: Int
  , x14 :: Int
  , x15 :: Int
  , x16 :: Int
  , x17 :: Int
  , x18 :: Int
  , x19 :: Int
  , x20 :: Int
  , x21 :: Int
  , x22 :: Int
  , x23 :: Int
  , x24 :: Int
  , x25 :: Int
  , x26 :: Int
  , x27 :: Int
  , x28 :: Int
  , x29 :: Int
  , x30 :: Int
  , x31 :: Int
  , x32 :: Int
  , x33 :: Int
  , x34 :: Int
  , x35 :: Int
  , x36 :: Int
  , x37 :: Int
  , x38 :: Int
  , x39 :: Int
  , x40 :: Int
  , x41 :: Int
  , x42 :: Int
  , x43 :: Int
  , x44 :: Int
  , x45 :: Int
  , x46 :: Int
  , x47 :: Int
  , x48 :: Int
  , x49 :: Int
  , x50 :: Int
  , x51 :: Int
  , x52 :: Int
  , x53 :: Int
  , x54 :: Int
  , x55 :: Int
  , x56 :: Int
  , x57 :: Int
  , x58 :: Int
  , x59 :: Int
  , x60 :: Int
  , x61 :: Int
  , x62 :: Int
  , x63 :: Int
  , x64 :: Int
  , x65 :: Int
  , x66 :: Int
  , x67 :: Int
  , x68 :: Int
  , x69 :: Int
  , x70 :: Int
  , x71 :: Int
  , x72 :: Int
  , x73 :: Int
  , x74 :: Int
  , x75 :: Int
  , x76 :: Int
  , x77 :: Int
  , x78 :: Int
  , x79 :: Int
  , x80 :: Int
  , x81 :: Int
  , x82 :: Int
  , x83 :: Int
  , x84 :: Int
  , x85 :: Int
  , x86 :: Int
  , x87 :: Int
  , x88 :: Int
  , x89 :: Int
  , x90 :: Int
  , x91 :: Int
  , x92 :: Int
  , x93 :: Int
  , x94 :: Int
  , x95 :: Int
  , x96 :: Int
  , x97 :: Int
  , x98 :: Int
  , x99 :: Int
  }
#if CONSTRUCTORS >= 2
  | X2 { x00 :: Int
       , x01 :: Int
       , x02 :: Int
       , x03 :: Int
       , x04 :: Int
       , x05 :: Int
       , x06 :: Int
       , x07 :: Int
       , x08 :: Int
       , x09 :: Int
       , x10 :: Int
       , x11 :: Int
       , x12 :: Int
       , x13 :: Int
       , x14 :: Int
       , x15 :: Int
       , x16 :: Int
       , x17 :: Int
       , x18 :: Int
       , x19 :: Int
       , x20 :: Int
       , x21 :: Int
       , x22 :: Int
       , x23 :: Int
       , x24 :: Int
       , x25 :: Int
       , x26 :: Int
       , x27 :: Int
       , x28 :: Int
       , x29 :: Int
       , x30 :: Int
       , x31 :: Int
       , x32 :: Int
       , x33 :: Int
       , x34 :: Int
       , x35 :: Int
       , x36 :: Int
       , x37 :: Int
       , x38 :: Int
       , x39 :: Int
       , x40 :: Int
       , x41 :: Int
       , x42 :: Int
       , x43 :: Int
       , x44 :: Int
       , x45 :: Int
       , x46 :: Int
       , x47 :: Int
       , x48 :: Int
       , x49 :: Int
       , x50 :: Int
       , x51 :: Int
       , x52 :: Int
       , x53 :: Int
       , x54 :: Int
       , x55 :: Int
       , x56 :: Int
       , x57 :: Int
       , x58 :: Int
       , x59 :: Int
       , x60 :: Int
       , x61 :: Int
       , x62 :: Int
       , x63 :: Int
       , x64 :: Int
       , x65 :: Int
       , x66 :: Int
       , x67 :: Int
       , x68 :: Int
       , x69 :: Int
       , x70 :: Int
       , x71 :: Int
       , x72 :: Int
       , x73 :: Int
       , x74 :: Int
       , x75 :: Int
       , x76 :: Int
       , x77 :: Int
       , x78 :: Int
       , x79 :: Int
       , x80 :: Int
       , x81 :: Int
       , x82 :: Int
       , x83 :: Int
       , x84 :: Int
       , x85 :: Int
       , x86 :: Int
       , x87 :: Int
       , x88 :: Int
       , x89 :: Int
       , x90 :: Int
       , x91 :: Int
       , x92 :: Int
       , x93 :: Int
       , x94 :: Int
       , x95 :: Int
       , x96 :: Int
       , x97 :: Int
       , x98 :: Int
       , x99 :: Int
       }
#endif
#if CONSTRUCTORS >= 3
  | X3 { x00 :: Int
       , x01 :: Int
       , x02 :: Int
       , x03 :: Int
       , x04 :: Int
       , x05 :: Int
       , x06 :: Int
       , x07 :: Int
       , x08 :: Int
       , x09 :: Int
       , x10 :: Int
       , x11 :: Int
       , x12 :: Int
       , x13 :: Int
       , x14 :: Int
       , x15 :: Int
       , x16 :: Int
       , x17 :: Int
       , x18 :: Int
       , x19 :: Int
       , x20 :: Int
       , x21 :: Int
       , x22 :: Int
       , x23 :: Int
       , x24 :: Int
       , x25 :: Int
       , x26 :: Int
       , x27 :: Int
       , x28 :: Int
       , x29 :: Int
       , x30 :: Int
       , x31 :: Int
       , x32 :: Int
       , x33 :: Int
       , x34 :: Int
       , x35 :: Int
       , x36 :: Int
       , x37 :: Int
       , x38 :: Int
       , x39 :: Int
       , x40 :: Int
       , x41 :: Int
       , x42 :: Int
       , x43 :: Int
       , x44 :: Int
       , x45 :: Int
       , x46 :: Int
       , x47 :: Int
       , x48 :: Int
       , x49 :: Int
       , x50 :: Int
       , x51 :: Int
       , x52 :: Int
       , x53 :: Int
       , x54 :: Int
       , x55 :: Int
       , x56 :: Int
       , x57 :: Int
       , x58 :: Int
       , x59 :: Int
       , x60 :: Int
       , x61 :: Int
       , x62 :: Int
       , x63 :: Int
       , x64 :: Int
       , x65 :: Int
       , x66 :: Int
       , x67 :: Int
       , x68 :: Int
       , x69 :: Int
       , x70 :: Int
       , x71 :: Int
       , x72 :: Int
       , x73 :: Int
       , x74 :: Int
       , x75 :: Int
       , x76 :: Int
       , x77 :: Int
       , x78 :: Int
       , x79 :: Int
       , x80 :: Int
       , x81 :: Int
       , x82 :: Int
       , x83 :: Int
       , x84 :: Int
       , x85 :: Int
       , x86 :: Int
       , x87 :: Int
       , x88 :: Int
       , x89 :: Int
       , x90 :: Int
       , x91 :: Int
       , x92 :: Int
       , x93 :: Int
       , x94 :: Int
       , x95 :: Int
       , x96 :: Int
       , x97 :: Int
       , x98 :: Int
       , x99 :: Int
       }
#endif
#if CONSTRUCTORS >= 4
  | X4 { x00 :: Int
       , x01 :: Int
       , x02 :: Int
       , x03 :: Int
       , x04 :: Int
       , x05 :: Int
       , x06 :: Int
       , x07 :: Int
       , x08 :: Int
       , x09 :: Int
       , x10 :: Int
       , x11 :: Int
       , x12 :: Int
       , x13 :: Int
       , x14 :: Int
       , x15 :: Int
       , x16 :: Int
       , x17 :: Int
       , x18 :: Int
       , x19 :: Int
       , x20 :: Int
       , x21 :: Int
       , x22 :: Int
       , x23 :: Int
       , x24 :: Int
       , x25 :: Int
       , x26 :: Int
       , x27 :: Int
       , x28 :: Int
       , x29 :: Int
       , x30 :: Int
       , x31 :: Int
       , x32 :: Int
       , x33 :: Int
       , x34 :: Int
       , x35 :: Int
       , x36 :: Int
       , x37 :: Int
       , x38 :: Int
       , x39 :: Int
       , x40 :: Int
       , x41 :: Int
       , x42 :: Int
       , x43 :: Int
       , x44 :: Int
       , x45 :: Int
       , x46 :: Int
       , x47 :: Int
       , x48 :: Int
       , x49 :: Int
       , x50 :: Int
       , x51 :: Int
       , x52 :: Int
       , x53 :: Int
       , x54 :: Int
       , x55 :: Int
       , x56 :: Int
       , x57 :: Int
       , x58 :: Int
       , x59 :: Int
       , x60 :: Int
       , x61 :: Int
       , x62 :: Int
       , x63 :: Int
       , x64 :: Int
       , x65 :: Int
       , x66 :: Int
       , x67 :: Int
       , x68 :: Int
       , x69 :: Int
       , x70 :: Int
       , x71 :: Int
       , x72 :: Int
       , x73 :: Int
       , x74 :: Int
       , x75 :: Int
       , x76 :: Int
       , x77 :: Int
       , x78 :: Int
       , x79 :: Int
       , x80 :: Int
       , x81 :: Int
       , x82 :: Int
       , x83 :: Int
       , x84 :: Int
       , x85 :: Int
       , x86 :: Int
       , x87 :: Int
       , x88 :: Int
       , x89 :: Int
       , x90 :: Int
       , x91 :: Int
       , x92 :: Int
       , x93 :: Int
       , x94 :: Int
       , x95 :: Int
       , x96 :: Int
       , x97 :: Int
       , x98 :: Int
       , x99 :: Int
       }
#endif
  deriving Generic

-- o
x_00_v :: X -> Int
x_00_v = view $ xfield @"x00"

x_00_o :: (Int -> Int) -> X -> X
x_00_o = over $ xfield @"x00"

x_01_v :: X -> Int
x_01_v = view $ xfield @"x01"

x_01_o :: (Int -> Int) -> X -> X
x_01_o = over $ xfield @"x01"

x_02_v :: X -> Int
x_02_v = view $ xfield @"x02"

x_02_o :: (Int -> Int) -> X -> X
x_02_o = over $ xfield @"x02"

x_03_v :: X -> Int
x_03_v = view $ xfield @"x03"

x_03_o :: (Int -> Int) -> X -> X
x_03_o = over $ xfield @"x03"

x_04_v :: X -> Int
x_04_v = view $ xfield @"x04"

x_04_o :: (Int -> Int) -> X -> X
x_04_o = over $ xfield @"x04"

x_05_v :: X -> Int
x_05_v = view $ xfield @"x05"

x_05_o :: (Int -> Int) -> X -> X
x_05_o = over $ xfield @"x05"

x_06_v :: X -> Int
x_06_v = view $ xfield @"x06"

x_07_o :: (Int -> Int) -> X -> X
x_07_o = over $ xfield @"x07"

x_08_v :: X -> Int
x_08_v = view $ xfield @"x08"

x_08_o :: (Int -> Int) -> X -> X
x_08_o = over $ xfield @"x08"

x_09_v :: X -> Int
x_09_v = view $ xfield @"x09"

x_09_o :: (Int -> Int) -> X -> X
x_09_o = over $ xfield @"x09"

----------------------------------------

x_10_v :: X -> Int
x_10_v = view $ xfield @"x10"

x_10_o :: (Int -> Int) -> X -> X
x_10_o = over $ xfield @"x10"

x_11_v :: X -> Int
x_11_v = view $ xfield @"x11"

x_11_o :: (Int -> Int) -> X -> X
x_11_o = over $ xfield @"x11"

x_12_v :: X -> Int
x_12_v = view $ xfield @"x12"

x_12_o :: (Int -> Int) -> X -> X
x_12_o = over $ xfield @"x12"

x_13_v :: X -> Int
x_13_v = view $ xfield @"x13"

x_13_o :: (Int -> Int) -> X -> X
x_13_o = over $ xfield @"x13"

x_14_v :: X -> Int
x_14_v = view $ xfield @"x14"

x_14_o :: (Int -> Int) -> X -> X
x_14_o = over $ xfield @"x14"

x_15_v :: X -> Int
x_15_v = view $ xfield @"x15"

x_15_o :: (Int -> Int) -> X -> X
x_15_o = over $ xfield @"x15"

x_16_v :: X -> Int
x_16_v = view $ xfield @"x16"

x_17_o :: (Int -> Int) -> X -> X
x_17_o = over $ xfield @"x17"

x_18_v :: X -> Int
x_18_v = view $ xfield @"x18"

x_18_o :: (Int -> Int) -> X -> X
x_18_o = over $ xfield @"x18"

x_19_v :: X -> Int
x_19_v = view $ xfield @"x19"

x_19_o :: (Int -> Int) -> X -> X
x_19_o = over $ xfield @"x19"

----------------------------------------

x_20_v :: X -> Int
x_20_v = view $ xfield @"x20"

x_20_o :: (Int -> Int) -> X -> X
x_20_o = over $ xfield @"x20"

x_21_v :: X -> Int
x_21_v = view $ xfield @"x21"

x_21_o :: (Int -> Int) -> X -> X
x_21_o = over $ xfield @"x21"

x_22_v :: X -> Int
x_22_v = view $ xfield @"x22"

x_22_o :: (Int -> Int) -> X -> X
x_22_o = over $ xfield @"x22"

x_23_v :: X -> Int
x_23_v = view $ xfield @"x23"

x_23_o :: (Int -> Int) -> X -> X
x_23_o = over $ xfield @"x23"

x_24_v :: X -> Int
x_24_v = view $ xfield @"x24"

x_24_o :: (Int -> Int) -> X -> X
x_24_o = over $ xfield @"x24"

x_25_v :: X -> Int
x_25_v = view $ xfield @"x25"

x_25_o :: (Int -> Int) -> X -> X
x_25_o = over $ xfield @"x25"

x_26_v :: X -> Int
x_26_v = view $ xfield @"x26"

x_27_o :: (Int -> Int) -> X -> X
x_27_o = over $ xfield @"x27"

x_28_v :: X -> Int
x_28_v = view $ xfield @"x28"

x_28_o :: (Int -> Int) -> X -> X
x_28_o = over $ xfield @"x28"

x_29_v :: X -> Int
x_29_v = view $ xfield @"x29"

x_29_o :: (Int -> Int) -> X -> X
x_29_o = over $ xfield @"x29"

----------------------------------------

x_30_v :: X -> Int
x_30_v = view $ xfield @"x30"

x_30_o :: (Int -> Int) -> X -> X
x_30_o = over $ xfield @"x30"

x_31_v :: X -> Int
x_31_v = view $ xfield @"x31"

x_31_o :: (Int -> Int) -> X -> X
x_31_o = over $ xfield @"x31"

x_32_v :: X -> Int
x_32_v = view $ xfield @"x32"

x_32_o :: (Int -> Int) -> X -> X
x_32_o = over $ xfield @"x32"

x_33_v :: X -> Int
x_33_v = view $ xfield @"x33"

x_33_o :: (Int -> Int) -> X -> X
x_33_o = over $ xfield @"x33"

x_34_v :: X -> Int
x_34_v = view $ xfield @"x34"

x_34_o :: (Int -> Int) -> X -> X
x_34_o = over $ xfield @"x34"

x_35_v :: X -> Int
x_35_v = view $ xfield @"x35"

x_35_o :: (Int -> Int) -> X -> X
x_35_o = over $ xfield @"x35"

x_36_v :: X -> Int
x_36_v = view $ xfield @"x36"

x_37_o :: (Int -> Int) -> X -> X
x_37_o = over $ xfield @"x37"

x_38_v :: X -> Int
x_38_v = view $ xfield @"x38"

x_38_o :: (Int -> Int) -> X -> X
x_38_o = over $ xfield @"x38"

x_39_v :: X -> Int
x_39_v = view $ xfield @"x39"

x_39_o :: (Int -> Int) -> X -> X
x_39_o = over $ xfield @"x39"

----------------------------------------

x_40_v :: X -> Int
x_40_v = view $ xfield @"x40"

x_40_o :: (Int -> Int) -> X -> X
x_40_o = over $ xfield @"x40"

x_41_v :: X -> Int
x_41_v = view $ xfield @"x41"

x_41_o :: (Int -> Int) -> X -> X
x_41_o = over $ xfield @"x41"

x_42_v :: X -> Int
x_42_v = view $ xfield @"x42"

x_42_o :: (Int -> Int) -> X -> X
x_42_o = over $ xfield @"x42"

x_43_v :: X -> Int
x_43_v = view $ xfield @"x43"

x_43_o :: (Int -> Int) -> X -> X
x_43_o = over $ xfield @"x43"

x_44_v :: X -> Int
x_44_v = view $ xfield @"x44"

x_44_o :: (Int -> Int) -> X -> X
x_44_o = over $ xfield @"x44"

x_45_v :: X -> Int
x_45_v = view $ xfield @"x45"

x_45_o :: (Int -> Int) -> X -> X
x_45_o = over $ xfield @"x45"

x_46_v :: X -> Int
x_46_v = view $ xfield @"x46"

x_47_o :: (Int -> Int) -> X -> X
x_47_o = over $ xfield @"x47"

x_48_v :: X -> Int
x_48_v = view $ xfield @"x48"

x_48_o :: (Int -> Int) -> X -> X
x_48_o = over $ xfield @"x48"

x_49_v :: X -> Int
x_49_v = view $ xfield @"x49"

x_49_o :: (Int -> Int) -> X -> X
x_49_o = over $ xfield @"x49"

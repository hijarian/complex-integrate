-- | Integration of complex and real functions along straight lines
module Data.Complex.Integrate (

  integrate

) where

-- We will work with complex numbers
import Data.Complex

-- | Integration of complex function using Simpson's rule
integrate :: (Fractional v) => 
    (v -> v)   -- ^ Function to be integrated
    -> Integer -- ^ Number of discretization segments    
    -> v       -- ^ Lower limit of the integration, and it's complex number
    -> v       -- ^ Upper limit of the integration, and it's complex number, too
    -> v       -- ^ Integration result
integrate f n a b =
    (f a + (4 * f_o) + (2 * f_e) + f b) * h / 3
        where
           h = getQuantizer a b n
           f_o = sum $ map (f . (+ a) . (* h) . fromInteger) [nn | nn <- [1..(n-1)], odd nn]
           f_e = sum $ map (f . (+ a) . (* h) . fromInteger) [nn | nn <- [2..(n-2)], even nn]


-- | Get step between <a> and <b> given number <n> of steps
getQuantizer :: (Fractional a) => a -> a -> Integer -> a
getQuantizer a b n = (b - a) / fromInteger n

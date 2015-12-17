module IOExtensions where
  readBinaryFile     :: FilePath -> IO String
  writeBinaryFile    :: FilePath -> String -> IO ()
  appendBinaryFile   :: FilePath -> String -> IO ()
  openBinaryFile     :: FilePath -> IOMode -> IO Handle

  getCh              :: IO Char
  argv               :: [String]

getChar :: IO Char
getChar = do 
           x <- getCh
           putChar x
           return x

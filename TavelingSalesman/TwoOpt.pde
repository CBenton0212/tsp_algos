
/**
 * Attempts to improve a pre-processed path by swapping 
 * different amounts of vertices in all possible ranges 
 * from the begining of the path to the end. 
 */
void twoOpt() {
  ArrayList<Point> tempPath = new ArrayList<Point>();
  copyTo(NN_all_path, two_opt_path);
  copyTo(two_opt_path, tempPath);
  
  int iterations = 0;
  
  while (iterations < 50) {
    double bestDistance = getPathLength(two_opt_path);

    for (int i = 1; i < two_opt_path.size() - 1; i++) {
      for (int k = i + 1; k < two_opt_path.size(); k++) {
        TwoOptSwap(tempPath, i, k);
        double newDistance = getPathLength(tempPath);
        
        if (newDistance < bestDistance) {
          iterations = 0;
          bestDistance = newDistance;
          copyTo(tempPath, two_opt_path);
        }
        
      }
    }
    
    iterations++;
  }
}

/**
 * Swaps paths of a given path between points begin and end.
 */
void TwoOptSwap(ArrayList<Point> tempPath, int begin, int end) {
  // copy path up to begin
  for (int index = 0; index <= begin - 1; index++) {
    tempPath.set(index, two_opt_path.get(index));
  }

  // reverse all vertices between start and emd
  int offset = 0;
  for (int index = begin; index <= end; index++) {
    tempPath.set(index, two_opt_path.get(end - offset));
    offset++;
  }

  // copy path from end to path length - 1
  for (int index = end + 1; index < two_opt_path.size(); index++) {
    tempPath.set(index, two_opt_path.get(index));
  }
}


/**
 * Parameterless method for single iteration of nearest
 * neighbor algorithm, mostly for consistency in setup().
 */
void one_iteration_NN() {
  one_iteration_NN(0, NN_one_path);
}

/**
 * Nearest Neighbor Algorithm (Greedy approach)
 * 
 * Starting from a given point, find that points nearest
 * neighbor and add it to your path. Move to this new point,
 * remove it from you set of available points, and find its 
 * nearest neighbor to continue the process. Repeat until 
 * there are no available points left.
 *
 * @param start    Specified starting point
 * @param path     Specified path to create/add to
 */
void one_iteration_NN(int start, ArrayList<Point> path) {
  ArrayList<Point> availablePoints = new ArrayList<Point>();
  setAllAvailable(availablePoints);

  Point current = points[start];
  path.add(current);
  availablePoints.remove(current);

  while (!availablePoints.isEmpty()) {
    Point closest = findClosest(current, availablePoints);
    path.add(closest);
    availablePoints.remove(closest);
    current = closest;
  }

  path.add(points[start]);
}

/**
 * Repetitive Nearest Neighbor Algorithm
 * 
 * Very similar to Nearest Neighbor, except this 
 * approach will use every point as its starting
 * point and compare the total path lengths to find
 * the 'most optimal' nearest neighbor path.
 */
void all_iteration_NN() {
  double minPathLength = Double.MAX_VALUE;

  for (int start = 0; start < numPoints; start++) {
    ArrayList<Point> tempPath = new ArrayList<Point>();
    one_iteration_NN(start, tempPath);

    double tempDist = getPathLength(tempPath);
    if (tempDist < minPathLength) {
      minPathLength = tempDist;
      NN_all_path = tempPath;
    }
  }
}

/**
 * Set all points as available upon initialization.
 *
 * 
 */
void setAllAvailable(ArrayList<Point> available) {
  for (int i = 0; i < points.length; i++) {
    available.add(points[i]);
  }
}

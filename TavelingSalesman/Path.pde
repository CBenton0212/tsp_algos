
/**
 * Calculate total path length of a given path.
 *
 * @param path    Specified path
 * @returns       Total path length
 */
double getPathLength(ArrayList<Point> path) {
  double pathLength = 0;

  for (int i = 0; i < path.size() - 1; i++) {
    int p1index = path.get(i).index;
    int p2index = path.get(i + 1).index;
    pathLength += distances[p1index][p2index];
  }

  int firstIndex = path.get(0).index;
  int lastIndex = path.get(path.size() - 1).index;
  pathLength += distances[lastIndex][firstIndex];

  return pathLength;
}

/**
 * Display a specified path on the main panel with a
 * specified color and stroke weight.
 * 
 * @param path     Specified path to be displayed
 * @param c        Specified color
 * @param weight   Specified stroke weight
 */
void drawPath(ArrayList<Point> path, color c, int weight) {
  stroke(c);
  strokeWeight(weight);
  Point p1 = path.get(0);

  for (int i = 1; i < path.size(); i++) {
    Point p2 = path.get(i);
    line(p1.x, p1.y, p2.x, p2.y);
    p1 = p2;
  }
}

/**
 * Copy one path to another.
 *
 * @param from    Path to be copied from
 * @param to      Path to be copied to
 */
void copyTo(ArrayList<Point> from, ArrayList<Point> to) {
  to.clear();
  for (Point p : from) {
    to.add(p);
  }
}

/**
 * Print path (by indeces) to console.
 */
void printPath(ArrayList<Point> path) {
  for (Point p : path) print(p.index + "->");
  print(path.get(0).index + "\tDistance: " + getPathLength(path) + "\n");
}

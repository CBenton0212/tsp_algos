


/**
 * Class for storing points by their index and position.
 */
class Point {

  int index;
  int x;
  int y;

  /**
   * Constructor for creating random points.
   *
   * @param index    Index of point in distance table
   */
  Point(int index) {
    this(index, int(random(MAIN_WIDTH)), int(random(MAIN_HEIGHT)));
  }

  /**
   * Constructor for creating points at specified position.
   *
   * @param index    Index of point in distance table
   * @param x        X position of point
   * @param y        Y position of point
   */
  Point(int index, int x, int y) {
    this.index = index;
    this.x = x;
    this.y = y;
  }

  /**
   * Display point on main panel.
   */
  void drawPoint() {
    stroke(pointColor);
    strokeWeight(5);
    point(x, y);
    fill(0);
    textSize(12);
  }

  /**
   * Calculate euclidian distance between this point
   * and a specified point.
   *
   * @param other    Specified point
   */
  double distance(Point other) {
    int a = other.x - this.x;
    int b = other.y - this.y;
    return sqrt((a * a) + (b * b));
  }
}

/**
 * Initialize/create all points.
 */
void createNewPoints() {
  for (int i = 0; i < numPoints; i++) {
    points[i] = new Point(i);
  }
}

/**
 * Display all points on main panel.
 */
void drawPoints() {
  for (int i = 0; i < numPoints; i++) {
    points[i].drawPoint();
  }
}

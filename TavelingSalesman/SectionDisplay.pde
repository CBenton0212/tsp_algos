
/**
 * Class for storing points by their index and position.
 */
void drawBoxedSections() {
  stroke(0);
  strokeWeight(3);
  noFill();
  int top = HEIGHT - SECTION_HEIGHT;
  
  rect(0, top, SECTION_WIDTH, HEIGHT);
  rect(SECTION_WIDTH, top, SECTION_WIDTH, HEIGHT);
  rect(2 * SECTION_WIDTH, top, SECTION_WIDTH, HEIGHT);
}

/**
 * Class for storing points by their index and position.
 */
void drawLabels() {
  stroke(100);
  strokeWeight(3);
  textSize(11);
  int top = HEIGHT - SECTION_HEIGHT + 12;
  
  text("Nearest Neighbor (" + (int)getPathLength(NN_one_path) + ")", 0 + 5, top);
  text("Improved NN (" + (int)getPathLength(NN_all_path) + ")", SECTION_WIDTH + 5, top);
  text("Two Opt (" + (int)getPathLength(two_opt_path) + ")", 2 * SECTION_WIDTH + 5, top);
}

/**
 * Class for storing points by their index and position.
 */
void drawSeparatePaths() {
  int top = HEIGHT - SECTION_HEIGHT + 12;
  
  ArrayList<Point> section_NN_one = new ArrayList<Point>();
  for (Point p : NN_one_path) {
    int x = int(map(p.x, 0, WIDTH, 0, SECTION_WIDTH));
    int y = int(map(p.y, 0, MAIN_HEIGHT, top, HEIGHT));
    Point newPoint = new Point(p.index, x, y);
    section_NN_one.add(newPoint);
  }
  
  drawPath(section_NN_one, RED, 2);
  
  ArrayList<Point> section_NN_all = new ArrayList<Point>();
  for (Point p : NN_all_path) {
    int x = int(map(p.x, 0, WIDTH, SECTION_WIDTH, 2 * SECTION_WIDTH));
    int y = int(map(p.y, 0, MAIN_HEIGHT, top, HEIGHT));
    Point newPoint = new Point(p.index, x, y);
    section_NN_all.add(newPoint);
  }
  
  drawPath(section_NN_all, YELLOW, 2);
  
  ArrayList<Point> section_two_opt = new ArrayList<Point>();
  for (Point p : two_opt_path) {
    int x = int(map(p.x, 0, WIDTH, 2 * SECTION_WIDTH, WIDTH));
    int y = int(map(p.y, 0, MAIN_HEIGHT, top, HEIGHT));
    Point newPoint = new Point(p.index, x, y);
    section_two_opt.add(newPoint);
  }
  
  drawPath(section_two_opt, GREEN, 2);
  
}

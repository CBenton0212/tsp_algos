
/**
 * 
 * Attempt to find the most optimal path along a
 * set of points. This program uses 3 different
 * algorithms, each being an improvement on the
 * last. Algorithms used are described in their 
 * respective tabs/methods.
 *
 * Press 'n' to generate new points/paths.
 *
 * Right now I am manually copying arrays often,
 * so 500 points is about the most that is worth 
 * waiting for.
 * 
 * 
 */

void settings() {
  size(WIDTH, HEIGHT);
}

void setup() {
  background(BGCOLOR);

  // initializaiton
  NN_one_path = new ArrayList<Point>();
  NN_all_path = new ArrayList<Point>();
  two_opt_path = new ArrayList<Point>();

  // create points and distance table
  createNewPoints();      // in Point tab
  drawPoints();           // in Point tab
  createDistanceTable();  // in DistanceTable tab
  
  // run through different algorithms
  one_iteration_NN();     // in NearestNeighbor tab
  all_iteration_NN();     // in NearestNeighbor tab
  twoOpt();               // in TwoOpt tab

  // display overlapping paths
  drawPath(NN_one_path, RED, 6);    // in Path tab
  drawPath(NN_all_path, YELLOW, 4); // in Path tab
  drawPath(two_opt_path, GREEN, 2); // in Path tab

  // display separated paths
  drawBoxedSections();     // in Point tab
  drawLabels();            // in Point tab
  drawSeparatePaths();     // in Point tab
  
  // print to console
  println("\n\n\n");
  println("Distances");
  println("Nearest Neighbor: " + getPathLength(NN_one_path));
  println("NN Improved: " + getPathLength(NN_all_path));
  println("Two-Opt Heuristic: " + getPathLength(two_opt_path));
  println("Press 'n' for a new set of points");
}

void draw() { }

void keyPressed() {
  if (key == 'n') setup();
}

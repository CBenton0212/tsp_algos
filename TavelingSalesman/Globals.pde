
/**
 * Height and width of entire window.
 * Works best with a 4:3 ratio.
 */
final int WIDTH = 800;
final int HEIGHT = 600;

/**
 * Number of points.
 */
int numPoints = 150;

/**
 * Colors to be used in display.
 */
final color RED = color(200, 0, 0);
final color YELLOW = color(240, 200, 30);
final color GREEN = color(0, 200, 0);
final color pointColor = color(255, 0, 0);
final color BGCOLOR = color(240, 240, 240);

/**
 * Variables reliant on height and width,
 * should not be modified.
 */
final int MAIN_WIDTH = WIDTH;
final int MAIN_HEIGHT = 2 * HEIGHT / 3;
final int SECTION_WIDTH = WIDTH / 3;
final int SECTION_HEIGHT = HEIGHT / 3;

/**
 * Variables reliant on number of points,
 * should not be modified.
 */
double[][] distances = new double[numPoints][numPoints];
Point[] points = new Point[numPoints];

/**
 * Individual paths.
 */
ArrayList<Point> NN_one_path;
ArrayList<Point> NN_all_path;
ArrayList<Point> two_opt_path;

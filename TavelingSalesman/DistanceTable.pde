
/**
 * Calculate distances between all points on initialization
 * and store in table for future lookup. This prevents
 * making the same calculations multiple times.
 */
void createDistanceTable() {
  for (int p1 = 0; p1 < numPoints; p1++) {
    for (int p2 = 0; p2 < numPoints; p2++) {
      distances[p1][p2] = points[p1].distance(points[p2]);
    }
  }
}

/**
 * Find the closest point to a given point, from a 
 * given set of available points.
 * 
 * @param p          Specified point to start from
 * @param available  Set of available points to choose from
 * @return           Point closest to specified point
 */
Point findClosest(Point p, ArrayList<Point> available) {
  assert available.size() > 0;
  double minDist = Double.MAX_VALUE;
  Point closest = available.get(0);

  for (Point availablePoint : available) {
    double tempDist = distances[p.index][availablePoint.index];

    if (tempDist <= minDist) {
      minDist = tempDist;
      closest = availablePoint;
    }
  }

  return closest;
}

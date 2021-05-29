
function uplots(k, w, zeta, step)
  LinearInterpolation(k, w, zeta, step);
  CentralDiff(k, w, zeta, step);
  Newmark(k, w, zeta, step)
end
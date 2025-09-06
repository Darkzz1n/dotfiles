const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0a0813", /* black   */
  [1] = "#8b1d48", /* red     */
  [2] = "#504e7e", /* green   */
  [3] = "#8f3c85", /* yellow  */
  [4] = "#77517e", /* blue    */
  [5] = "#516984", /* magenta */
  [6] = "#89758a", /* cyan    */
  [7] = "#8e8c96", /* white   */

  /* 8 bright colors */
  [8]  = "#5a576b",  /* black   */
  [9]  = "#BA2760",  /* red     */
  [10] = "#6B68A9", /* green   */
  [11] = "#BF50B2", /* yellow  */
  [12] = "#9F6CA9", /* blue    */
  [13] = "#6C8CB1", /* magenta */
  [14] = "#B79CB8", /* cyan    */
  [15] = "#c1c1c4", /* white   */

  /* special colors */
  [256] = "#0a0813", /* background */
  [257] = "#c1c1c4", /* foreground */
  [258] = "#c1c1c4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;

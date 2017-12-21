
#Clears all plots
clear = function() {
  if (!is.null(dev.list())) dev.off()
}

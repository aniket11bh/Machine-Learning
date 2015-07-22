function plot_likelihood(x1,x2)
for a = 1: 8
  [f,xi] = ksdensity(x1(:,a));
  figure
  plot(xi,f,'-g','LineWidth',2);
  hold on
  [f,xi] = ksdensity(x2(:,a));
  plot(xi,f,'-b','LineWidth',2);
  pause;
end

end

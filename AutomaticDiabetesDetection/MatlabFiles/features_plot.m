function features_plot(X)
for a = 1 : 8
  [f,xi] = ksdensity(X(:,a));
  plot(xi,f,'-r','LineWidth',2);
  pause;
end

end
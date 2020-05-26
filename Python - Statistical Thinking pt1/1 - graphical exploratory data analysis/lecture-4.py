# exercise 1

# Draw 100000 samples from Normal distribution with stds of interest: samples_std1, samples_std3, samples_std10
samples_std1 = np.random.normal(size=100000,loc=20,scale=1)
samples_std3 = np.random.normal(size=100000,loc=20,scale=3)
samples_std10 = np.random.normal(size=100000,loc=20,scale=10)

# Make histograms
plt.hist(samples_std1,bins=100,normed=True,histtype='step')
plt.hist(samples_std3,bins=100,normed=True,histtype='step')
plt.hist(samples_std10,bins=100,normed=True,histtype='step')

# Make a legend, set limits and show plot
_ = plt.legend(('std = 1', 'std = 3', 'std = 10'))
plt.ylim(-0.01, 0.42)
plt.show()

# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- 
# exercise 2

# Generate CDFs
x_std1,y_std1=ecdf(samples_std1)
x_std3,y_std3=ecdf(samples_std3)
x_std10,y_std10=ecdf(samples_std10)

# Plot CDFs
plt.plot(x_std1,y_std1,marker='.',linestyle='none')
plt.plot(x_std3,y_std3,marker='.',linestyle='none')
plt.plot(x_std10,y_std10,marker='.',linestyle='none')

# Make a legend and show the plot
_ = plt.legend(('std = 1', 'std = 3', 'std = 10'), loc='lower right')
plt.show()

# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- 
# exercise 3

# Compute mean and standard deviation: mu, sigma
mu=np.mean(belmont_no_outliers)
sigma = np.std(belmont_no_outliers)

# Sample out of a normal distribution with this mu and sigma: samples
samples = np.random.normal(size=10000, loc=mu, scale=sigma)

# Get the CDF of the samples and of the data
x_theor,y_theor=ecdf(samples)
x,y = ecdf(belmont_no_outliers)

# Plot the CDFs and show the plot
_ = plt.plot(x_theor, y_theor)
_ = plt.plot(x, y, marker='.', linestyle='none')
_ = plt.xlabel('Belmont winning time (sec.)')
_ = plt.ylabel('CDF')
plt.show()

# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- 
# exercise 4

# Take a million samples out of the Normal distribution: samples
samples = np.random.normal(mu, sigma, size=1000000)

# Compute the fraction that are faster than 144 seconds: prob
prob = np.sum(samples <= 144) / len(samples)

# Print the result
print('Probability of besting Secretariat:', prob)

# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- 
# exercise 5

def successive_poisson(tau1, tau2, size=1):
    """Compute time for arrival of 2 successive Poisson processes."""
    # Draw samples out of first exponential distribution: t1
    t1 = np.random.exponential(tau1, size)

    # Draw samples out of second exponential distribution: t2
    t2 = np.random.exponential(tau2, size)

    return t1 + t2

# ----//---- ----//---- ----//---- ----//---- ----//---- ----//---- 
# exercise 6

# Draw samples of waiting times: waiting_times
waiting_times = successive_poisson(764,715,100000)

# Make the histogram
plt.hist(waiting_times,bins=100,normed=True, histtype='step')

# Label axes
plt.xlabel("Waiting Times")
plt.ylabel("Probability")

# Show the plot
plt.show()
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Contains: Perceptron Learning Rule with Soft Threshold
# Name: perceptron_hard.py
# Course Instructor: Milos Manic
# Provided by: Course Instructor
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
from math import exp


def sigmoid(x):
    k = 1.0
    r0 = 2/(1+exp(-2 * k * x))-1
    r1 = k*(1 - r0 * r0)
    return [r0, r1]


def print_data(n, p, net, error, learned, weights, writefile):
    print('ite= {} p= {} net= {} err= {} lrn= {}\nweights: {}'.format(
        n, p, round(net, 2), round(error, 3), round(learned, 3),
        ' '.join(str(round(weight, 2)) for weight in weights)))
    writefile.write('ite= {} p= {} net= {} err= {} lrn= {}\nweights: {}'.format(
        n, p, round(net, 2), round(error, 3), round(learned, 3),
        ' '.join(str(round(weight, 2)) for weight in weights)) + '\n')


if __name__ == '__main__':
    # Open a new file for writing output.
    output = 'H213_delta.txt'
    with open(output, 'w') as write_file:
        iterations = 100        # Number of training cycles
        num_patterns = 8        # Number of patterns
        num_inputs = 4          # Number of augmented inputs
        alpha = 2.2              # Learning constant
        weights = [1, 1, 1, 1]    # List of weights
        patterns = [
            [0, 0, 0, 1],
            [0, 0, 1, 1],
            [0, 1, 0, 1],
            [0, 1, 1, 1],
            [1, 0, 0, 1],
            [1, 0, 1, 1],
            [1, 1, 0, 1],
            [1, 1, 1, 1]
        ]
        desired_out = [-1, -1, -1, -1, -1, 1, -1, 1]   # Desired output as a 1-dimensional list
        # desired_out = [0, 0, 0, 0, 0, 1, 0, 1]   # Desired output as a 1-dimensional list

        # For each iteration
        for n in range(iterations):
            total_error = 0     # Total error
            # Perceptron's predicted output for each pattern
            predicted_out = [0 for _ in range(num_patterns)]
            delo = [0 for _ in range(num_patterns)]

            # For each pattern
            for p in range(num_patterns):
                # Net of weights * inputs
                net = sum(weight * pattern
                          for weight, pattern in zip(weights, patterns[p]))

                # Use output function
                [predicted_out[p], delo[p]] = sigmoid(net)
                # Calculating error
                error = desired_out[p] - predicted_out[p]
                total_error += error**2
                # Learning coefficient
                learned = delo[p] * alpha * error

                # Print data to output file & standard out
                print_data(n, p, net, error, learned, weights, write_file)

                # Update weights
                weights = [weight + learned * pattern
                           for weight, pattern in zip(weights, patterns[p])]
            print('TE= ', round(total_error, 6))
            write_file.write('TE= ' + str(round(total_error, 6)) + '\n')

            # Exit loop if error is small
            if total_error < 0.001:
                break

    # Wait for user response
    input()

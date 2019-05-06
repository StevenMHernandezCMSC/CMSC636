S1 = [1 1 1 -1]
S2 = [1 1 -1 -1]
S3 = [1 -1 -1 -1]


W = (S1'*S1) + (S2'*S2) % + (S3'*S3)

output = []

for b1 = 1:-2:-1
    for b2 = 1:-2:-1
        for b3 = 1:-2:-1
            for b4 = 1:-2:-1
                y = [b1 b2 b3 b4];
                E = -0.5 * y * W * y';
                strjoin(string(y)) + " : " + E
                
                output = [output E]
            end
        end
    end
end
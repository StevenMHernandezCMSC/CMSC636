#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Contains: Perceptron Learning Rule with Soft Threshold
# Name: perceptron_soft.pl
# Course Instructor: Milos Manic
# Provided by: Course Instructor
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

open (OUTF,'&gt;out_perc_soft.txt') || die;  # opening a new file out.txt for writing
$ite=100;  			# number of training cycles
$np=2; 				# number of patterns
$ni=3; 				# number of augmented inputs
$alpha=0.3; 		# learning constant
@ww= (1, 3, -3);  # array of weights
@pat=([1, 2, 1],[2, 1, 1]); # patterns as 2-dim array
@dout=(-1, 1);      # desired output as 1-dim array
for $n (0..$ite-1) {   		# number of training cycles
	$terr=0;				# initialization of total error
	for $p (0..$np-1) {		# for all patterns
   	$net=0;
   	for $i (0..$ni-1) { 	# for all inputs
       	$net = $net +$ww[$i]*$pat[$p][$i];
		}
		$ou[$p] = fbip($net); 		# use activation function
		$err=$dout[$p]-$ou[$p];    # calculating error
		$terr=$terr+$err*$err;
		$learn=$alpha*$err;			# learning coefficient
      &amp;printdata($n,$p,$net,$err,$learn,@ww); # printing data to output file
		for $i (0..$ni-1) { # for all inputs
        	$ww[$i] = $ww[$i] + $learn*$pat[$p][$i];  # change weights
		}
	}
	printf "TE=%9.6f \n", $terr; printf OUTF "TE=%9.6f \n", $terr;
	if ($terr &lt;0.001) {last} 	# exiting iteration loop if error is small
}
close OUTF; # closing the output file
$ch=&lt;STDIN&gt;; # wait for user response

#########  subroutines  ###########
sub fbip
{
	$k=1;
	my $x = @_[0];
	my $r;
	$r = 2/(1+exp(-2*$k*$x))-1;  # function
#	print "$x  $r\n";
   return $r;
}

sub printdata
{
	($n,$p,$net,$err,$learn,@ww)=@_;
		printf "ite=%3d p=%d net=%5.2f err =%6.3f lrn =%6.3f \nweights:",
		$n,$p,$net,$err,$learn;
		printf OUTF "ite=%3d p=%d net=%5.2f err =%6.3f lrn =%6.3f \nweights:",
		$n,$p,$net,$err,$learn;
		for $i (0..$ni-1) { printf "%6.2f ", $ww[$i]; printf OUTF "%6.2f ", $ww[$i]; }
		print " \n"; print OUTF " \n";
}

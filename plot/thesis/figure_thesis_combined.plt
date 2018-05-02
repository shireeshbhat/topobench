###
###  Released under the MIT License (MIT) --- see ../LICENSE
###  Copyright (c) 2014 Ankit Singla, Sangeetha Abdu Jyothi, Chi-Yao Hong, Lucian Popa, P. Brighten Godfrey, Alexandra Kolla, Simon Kassing
###

# Note you need gnuplot 4.4 for the pdfcairo terminal.
set terminal pdfcairo font "Gill Sans, 16" linewidth 1.8 rounded dashed
set size ratio 0.6

#set rmargin 0
#set lmargin 0
#set tmargin 0
#set bmargin 0


# Line style for axes
set style line 80 lt rgb "#808080"

# Line style for grid
set style line 81 lt 0  # dashed
set style line 81 lt rgb "#A0A0A0"  # grey

set grid back linestyle 81
set border 3 back linestyle 80 # Remove border on top and right.  These
             # borders are useless and make it harder
	                  # to see plotted lines near the border.
			      # Also, put it in grey; no need for so much emphasis on a border.
			      set xtics nomirror
			      set ytics nomirror

#set log x
#set mxtics 10    # Makes logscale look good.
set key width -12
# Line styles: try to pick pleasing colors, rather
# than strictly primary colors or hard-to-see colors
# like gnuplot's default yellow.  Make the lines thick
# so they're easy to see in small plots in papers.
set style line 1 lc rgb "#2177b0" lt 2 dashtype 3 pt 0 lw 2
set style line 2 lc rgb "#d42a2d" lt 2 dashtype 4 pt 0 lw 2
set style line 3 lc rgb "#2f9e37" lt 2 dashtype 5 pt 0 lw 2
set style line 4 lc rgb "#fc7f2b"  dashtype 4 lw 2 pt 8
set style line 5 lt rgb "#9167b8" lw 2 pt 2
set style line 6 lt rgb "#7d7d7d" lw 2 pt 6

set output "figure_thesis_combined.pdf"
set xlabel "Fraction of servers with traffic demand"
set ylabel "Throughput per server"
set xrange [0.1:1]
set yrange [0:1]

set key font ",13"
#set key noopaque
#set key top right
set key at 1.54,1
#set key opaque
set key noopaque
set key invert
set size .75, 1
set key spacing 1.3

plot 	\
"../../results/thesis/thesis_combined_fat_tree.txt" using 1:($2 > 1 ? 1 : $2) title "Equal-cost fat-tree"  w lp ls 5, \
"../../results/thesis/thesis_combined_bound_unlimited_TA_half.txt" using 1:2 title "Perfect TA 50%"  w lp ls 1, \
"../../results/thesis/thesis_combined_bound_restricted_TA.txt" using 1:($2 > 1 ? 1 : $2) title "Restricted TA"  w lp ls 4, \
"../../results/thesis/thesis_combined_bound_unlimited_TA_two_thirds.txt" using 1:2 title "Perfect TA 66%"  w lp ls 2, \
"../../results/thesis/thesis_jellyfish_filtered_578_mawp_fraction.txt" using 6:((strcol(2) eq "SL=1") ? ($7 / 24) : 1/0) title "Expander"  w lp ls 6, \
"../../results/thesis/thesis_combined_bound_unlimited_TA_one.txt" using 1:($2 > 1 ? 1 : $2) title "Perfect TA 100%"  w lp ls 3, \





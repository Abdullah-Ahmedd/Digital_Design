# Compile with functional coverage enabled
#chnage what is before .sv to the top module name and the testbenchname
vlog multi_op_processor.sv multi_op_processor_tb.sv +cover=f -covercells

# Start simulation with coverage enabled
#change what after work. to the name of the testbench top module
vsim work.multi_op_processor_tb -cover

# Save the coverage database when the simulation exits
coverage save -onexit cov.ucdb

# Run the simulation
run -all

# Generate a text report
coverage report -details -output cov_report.txt

# (Optional) Generate a summary report
coverage report


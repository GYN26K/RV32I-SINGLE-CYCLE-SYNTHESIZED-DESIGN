# RISCV single cycle synthesis

read_libs /Data/cad/cadence/installs/FOUNDRY/digital/90nm/lib/typical.lib

read_hdl \
/home/24EC01019/Desktop/verilog_files/RV32I-SINGLE-CYCLE-EXTENDED/source_files/alu_control.v \
/home/24EC01019/Desktop/verilog_files/RV32I-SINGLE-CYCLE-EXTENDED/source_files/alu.v \
/home/24EC01019/Desktop/verilog_files/RV32I-SINGLE-CYCLE-EXTENDED/source_files/control_unit.v \
/home/24EC01019/Desktop/verilog_files/RV32I-SINGLE-CYCLE-EXTENDED/source_files/data_memory.v \
/home/24EC01019/Desktop/verilog_files/RV32I-SINGLE-CYCLE-EXTENDED/source_files/immediate_extender.v \
/home/24EC01019/Desktop/verilog_files/RV32I-SINGLE-CYCLE-EXTENDED/source_files/instr_decoder.v \
/home/24EC01019/Desktop/verilog_files/RV32I-SINGLE-CYCLE-EXTENDED/source_files/mux_for_alu.v \
/home/24EC01019/Desktop/verilog_files/RV32I-SINGLE-CYCLE-EXTENDED/source_files/mux_for_pc.v \
/home/24EC01019/Desktop/verilog_files/RV32I-SINGLE-CYCLE-EXTENDED/source_files/mux_for_result.v \
/home/24EC01019/Desktop/verilog_files/RV32I-SINGLE-CYCLE-EXTENDED/source_files/pcadder.v \
/home/24EC01019/Desktop/verilog_files/RV32I-SINGLE-CYCLE-EXTENDED/source_files/pctarget.v \
/home/24EC01019/Desktop/verilog_files/RV32I-SINGLE-CYCLE-EXTENDED/source_files/program_counter.v \
/home/24EC01019/Desktop/verilog_files/RV32I-SINGLE-CYCLE-EXTENDED/source_files/register_file.v \
/home/24EC01019/Desktop/verilog_files/RV32I-SINGLE-CYCLE-EXTENDED/source_files/top_module.v

elaborate top_module

create_clock -name clk -period 10 [get_ports clk]

check_design

syn_generic
syn_map
syn_opt

report_area > area.rpt
report_timing > timing.rpt
write_hdl > RV32I_synth.v

puts "*********************Done with synthesis*************************"

exit

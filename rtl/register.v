module register(
    input clk,
    input rst,
    input wr_en,

    input [2:0] wr_addr,
    input [7:0] wr_data,
    input [2:0] rd_addr,

    output [7:0] rd_data
);

reg [7:0] mem [7:0] ;

integer i;
always @(posedge clk or posedge rst) begin
    if (rst) begin
        for (i = 0;i<8 ;i=i+1 ) begin
            mem[i] <= 8'b0;
        end
    end
    else
    begin
        if (wr_en) begin
            mem[wr_addr] <= wr_data;
        end
    end
end

assign rd_data = mem[rd_addr];

endmodule

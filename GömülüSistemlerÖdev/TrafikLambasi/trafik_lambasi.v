module trafik_lambasi(
    input clk,
    output reg led_red,
    output reg led_blue,
    output reg led_green
);

reg [31:0] timer = 0;

always @(posedge clk) begin

    timer <= timer + 1;
    if (timer >= 0 && timer < 200_000_000) begin // 10 saniye boyunca kirmizi led yanacak
        led_red <= 0;
        led_blue <= 1;
        led_green <= 1;
    end 
    else if (timer >= 200_000_000 && timer < 310_000_000) begin // 5 saniye boyunca yesil led yanacak
        led_red <= 1;
        led_blue <= 1;
        led_green <= 0;
    end 
    else if (timer >= 310_000_000 && timer < 370_000_000) begin // 2 saniye boyunca mavi led yanacak
        led_red <= 1;
        led_blue <= 0;
        led_green <= 1;
    end 
    /*else if (timer >= 370_000_000 && timer < 430_000_000) begin // 2 saniye boyunca mavi led yanacak
        led_red <= 0;
        led_blue <= 1;
        led_green <= 0;
    end 
    else if (timer >= 430_000_000 && timer < 490_000_000) begin // 2 saniye boyunca mavi led yanacak
        led_red <= 0;
        led_blue <= 0;
        led_green <= 1;
    end */
    else begin
        timer <= 0;
    end
end

endmodule
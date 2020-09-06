-- fsm.vhd: Finite State Machine
-- Author(s): David Mihola, xmihol00, FIT, xmihol00@stud.fit.vutbr.cz
--
library ieee;
use ieee.std_logic_1164.all;
-- ----------------------------------------------------------------------------
--                        Entity declaration
-- ----------------------------------------------------------------------------
entity fsm is
port(
   CLK         : in  std_logic;
   RESET       : in  std_logic;

   -- Input signals
   KEY         : in  std_logic_vector(15 downto 0);
   CNT_OF      : in  std_logic;

   -- Output signals
   FSM_CNT_CE  : out std_logic; -- Moore
   FSM_MX_MEM  : out std_logic; -- Moore
   FSM_MX_LCD  : out std_logic; -- Moore
   FSM_LCD_WR  : out std_logic; -- Mealy
   FSM_LCD_CLR : out std_logic  -- Mealy
);
end entity fsm;

-- ----------------------------------------------------------------------------
--                      Architecture declaration
-- ----------------------------------------------------------------------------
architecture behavioral of fsm is
   type t_state is (INPUT_1, INPUT_2, INPUT_3, INPUT_4a, INPUT_5a, INPUT_6a, INPUT_7a, INPUT_8a, INPUT_9a, INPUT_10a, 
															  INPUT_4b, INPUT_5b, INPUT_6b, INPUT_7b, INPUT_8b, INPUT_9b, INPUT_10b,
							CONFIRM, DENIED, PRINT_DENIED, PRINT_ACCESS, FINISH);
   signal present_state, next_state : t_state;

begin
-- -------------------------------------------------------
sync_logic : process(RESET, CLK)
begin
   if (RESET = '1') then
      present_state <= INPUT_1;
   elsif (CLK'event AND CLK = '1') then
      present_state <= next_state;
   end if;
end process sync_logic;

-- -------------------------------------------------------
next_state_logic : process(present_state, KEY, CNT_OF)
begin
   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
   when INPUT_1 =>
      next_state <= INPUT_1;
      if (KEY(15) = '1') then
         next_state <= PRINT_DENIED;
		end if;
		if (KEY(2) = '1') then
			next_state <= INPUT_2;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= DENIED;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when INPUT_2 =>
      next_state <= INPUT_2;
      if (KEY(15) = '1') then
         next_state <= PRINT_DENIED;
		end if;
		if (KEY(3) = '1') then
			next_state <= INPUT_3;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= DENIED;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when INPUT_3 =>
      next_state <= INPUT_3;
      if (KEY(15) = '1') then
         next_state <= PRINT_DENIED;
		end if;
		if (KEY(1) = '1') then
			next_state <= INPUT_4a;
		elsif (KEY(0) = '1') then
			next_state <= INPUT_4b;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= DENIED;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when INPUT_4a =>
      next_state <= INPUT_4a;
      if (KEY(15) = '1') then
         next_state <= PRINT_DENIED;
		end if;
		if (KEY(4) = '1') then
			next_state <= INPUT_5a;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= DENIED;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when INPUT_5a =>
      next_state <= INPUT_5a;
      if (KEY(15) = '1') then
         next_state <= PRINT_DENIED;
		end if;
		if (KEY(8) = '1') then
			next_state <= INPUT_6a;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= DENIED;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when INPUT_6a =>
      next_state <= INPUT_6a;
      if (KEY(15) = '1') then
         next_state <= PRINT_DENIED;
		end if;
		if (KEY(9) = '1') then
			next_state <= INPUT_7a;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= DENIED;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when INPUT_7a =>
      next_state <= INPUT_7a;
      if (KEY(15) = '1') then
         next_state <= PRINT_DENIED;
		end if;
		if (KEY(7) = '1') then
			next_state <= INPUT_8a;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= DENIED;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when INPUT_8a =>
      next_state <= INPUT_8a;
      if (KEY(15) = '1') then
         next_state <= PRINT_DENIED;
		end if;
		if (KEY(6) = '1') then
			next_state <= INPUT_9a;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= DENIED;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when INPUT_9a =>
      next_state <= INPUT_9a;
      if (KEY(15) = '1') then
         next_state <= PRINT_DENIED;
		end if;
		if (KEY(5) = '1') then
			next_state <= INPUT_10a;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= DENIED;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when INPUT_10a =>
      next_state <= INPUT_10a;
      if (KEY(15) = '1') then
         next_state <= PRINT_DENIED;
		end if;
		if (KEY(1) = '1') then
			next_state <= CONFIRM;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= DENIED;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when INPUT_4b =>
      next_state <= INPUT_4b;
      if (KEY(15) = '1') then
         next_state <= PRINT_DENIED;
		end if;
		if (KEY(1) = '1') then
			next_state <= INPUT_5b;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= DENIED;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when INPUT_5b =>
      next_state <= INPUT_5b;
      if (KEY(15) = '1') then
         next_state <= PRINT_DENIED;
		end if;
		if (KEY(8) = '1') then
			next_state <= INPUT_6b;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= DENIED;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when INPUT_6b =>
      next_state <= INPUT_6b;
      if (KEY(15) = '1') then
         next_state <= PRINT_DENIED;
		end if;
		if (KEY(6) = '1') then
			next_state <= INPUT_7b;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= DENIED;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when INPUT_7b =>
      next_state <= INPUT_7b;
      if (KEY(15) = '1') then
         next_state <= PRINT_DENIED;
		end if;
		if (KEY(3) = '1') then
			next_state <= INPUT_8b;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= DENIED;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when INPUT_8b =>
      next_state <= INPUT_8b;
      if (KEY(15) = '1') then
         next_state <= PRINT_DENIED;
		end if;
		if (KEY(9) = '1') then
			next_state <= INPUT_9b;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= DENIED;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when INPUT_9b =>
      next_state <= INPUT_9b;
      if (KEY(15) = '1') then
         next_state <= PRINT_DENIED;
		end if;
		if (KEY(2) = '1') then
			next_state <= INPUT_10b;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= DENIED;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when INPUT_10b =>
      next_state <= INPUT_10b;
      if (KEY(15) = '1') then
         next_state <= PRINT_DENIED;
		end if;
		if (KEY(8) = '1') then
			next_state <= CONFIRM;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= DENIED;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when CONFIRM =>
      next_state <= CONFIRM;
      if (KEY(15) = '1') then
         next_state <= PRINT_ACCESS;
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= DENIED;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when DENIED =>
      next_state <= DENIED;
      if (KEY(15) = '1') then
         next_state <= PRINT_DENIED;
		end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_DENIED =>
      next_state <= PRINT_DENIED;
      if (CNT_OF = '1') then
         next_state <= FINISH;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_ACCESS =>
      next_state <= PRINT_ACCESS;
      if (CNT_OF = '1') then
         next_state <= FINISH;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      next_state <= FINISH;
      if (KEY(15) = '1') then
         next_state <= INPUT_1; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when others =>
      next_state <= INPUT_1;
   end case;
end process next_state_logic;

-- -------------------------------------------------------
output_logic : process(present_state, KEY)
begin
   FSM_CNT_CE     <= '0';
   FSM_MX_MEM     <= '0';
   FSM_MX_LCD     <= '0';
   FSM_LCD_WR     <= '0';
   FSM_LCD_CLR    <= '0';

   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
   when INPUT_1 | INPUT_2 | INPUT_3 | INPUT_4a | INPUT_5a | INPUT_6a | INPUT_7a | INPUT_8a | INPUT_9a | INPUT_10a |
		  DENIED | CONFIRM            | INPUT_4b | INPUT_5b | INPUT_6b | INPUT_7b | INPUT_8b | INPUT_9b | INPUT_10b =>
      if (KEY(14 downto 0) /= "000000000000000") then
         FSM_LCD_WR     <= '1'; -- Mealy
      end if;
      if (KEY(15) = '1') then
         FSM_LCD_CLR    <= '1'; -- Mealy
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_DENIED =>
		FSM_LCD_WR     <= '1';
	
      FSM_CNT_CE     <= '1'; -- Moore
      FSM_MX_LCD     <= '1'; -- Moore
		FSM_MX_MEM     <= '0'; -- Moore
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_ACCESS =>
		FSM_LCD_WR     <= '1';
	
      FSM_CNT_CE     <= '1'; -- Moore
      FSM_MX_LCD     <= '1'; -- Moore
		FSM_MX_MEM     <= '1'; -- Moore
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      if (KEY(15) = '1') then
         FSM_LCD_CLR    <= '1';
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when others =>
   end case;
end process output_logic;

end architecture behavioral;


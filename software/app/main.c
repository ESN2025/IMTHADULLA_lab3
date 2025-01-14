#include <stdio.h>
#include <unistd.h>                       
#include "system.h"                       
#include "io.h"                           
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"
#include "altera_avalon_timer_regs.h"
#include "altera_avalon_timer.h"
#include "sys/alt_irq.h"
#include "sys/alt_sys_init.h"   

#define SEG0   PIO_0_BASE
#define SEG1   PIO_1_BASE
#define SEG2   PIO_2_BASE


volatile int interrupt_flag = 0;  // Flag pour vérifier si l'interruption s'est produite
volatile int counter = 0;  // Flag pour vérifier si l'interruption s'est produite

// Fonction d'IRQ du timer
void timer_isr(void* context) {
    // Si l'interruption provient du timer, on réinitialise le flag
	counter++;
    interrupt_flag = 1;
    // Réinitialisation du timer pour éviter des interruptions multiples non voulues
    IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE, 0);
}

int main() {
    int count0 = 0;
    int count1 = 0;
    int count2 = 0;

    // Initialisation du timer
    // Enregistrement de l'ISR (Interruption Service Routine) pour le timer
    alt_irq_register(TIMER_0_IRQ, NULL, timer_isr);

    while(1) {
		if (interrupt_flag){
			if (counter > 999){
				counter = 0;
			}
			count0 = counter % 10;          // La première décimale (0-9)
            count1 = (counter / 10) % 10;   // La deuxième décimale (0-9)
            count2 = (counter / 100) % 10;  // La troisième décimale (0-9)
			IOWR_ALTERA_AVALON_PIO_DATA(SEG2, count2);
			IOWR_ALTERA_AVALON_PIO_DATA(SEG0, count1); // J'ai inverser les connection sur le VHDL d'ou le changement
			IOWR_ALTERA_AVALON_PIO_DATA(SEG1, count0);
		}
    }
}
.data
resultado: .asciiz "\nResultado: "
operande: .asciiz "\nDigite um numero: "
operador: .asciiz "\nDigite um operador: "

.text

main:
	jal operando
	move $s0, $v0
	
	jal operacao
	move $s2, $v0
	
	jal operando
	move $s1, $v0
	
	beq $s2, 43, add_
	beq $s2, 45, sub_
	beq $s2, 42, mult_
	
	beq $s2, 47, div_
	
	
	
	li $v0, 10
	syscall
	
add_:
	add $v0, $s0, $s1
	j print_r

sub_: 
	sub $v0, $s0, $s1
	j print_r
	
mult_: 
	mul $v0, $s0, $s1
	j print_r

div_: 	
	div $v0, $s0, $s1
	j print_r

print_r: 
	move $t0, $v0
	li $v0, 4
	la $a0, resultado
	syscall
	
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	li $v0, 10
	syscall

operando:
	li $v0, 4
	la $a0, operande
	syscall
	
	li $v0, 5
	syscall
	
	jr $ra
	
operacao:
	li $v0, 4
	la $a0, operador
	syscall
	
	li $v0, 12
	syscall
	
	jr $ra
	
;--------------------------------------------------------------------------
;  crt0.s - adopted for a KC85(5)
;
;  Copyright (C) 2014, Andreas Ziermann (Z1013)
;                2015, Bert Lange
;
;  This library is free software; you can redistribute it and/or modify it
;  under the terms of the GNU General Public License as published by the
;  Free Software Foundation; either version 2, or (at your option) any
;  later version.
;
;  This library is distributed in the hope that it will be useful,
;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;  GNU General Public License for more details.
;
;  You should have received a copy of the GNU General Public License 
;  along with this library; see the file COPYING. If not, write to the
;  Free Software Foundation, 51 Franklin Street, Fifth Floor, Boston,
;   MA 02110-1301, USA.
;
;  As a special exception, if you link this library with other files,
;  some of which are compiled with SDCC, to produce an executable,
;  this library does not by itself cause the resulting executable to
;  be covered by the GNU General Public License. This exception does
;  not however invalidate any other reasons why the executable file
;   might be covered by the GNU General Public License.
;--------------------------------------------------------------------------

    .module crt0

    .globl  _main

    .area   _HEADER (ABS)
    .org    0x200


    ;; Ordering of segments for the linker.
    .area   _HOME
    .area   _CODE
    .area   _INITIALIZER
    .area _GSINIT
    .area _GSFINAL
    .area _GSEXIT
    .area _GSEXITFINAL
    .area   _DATA
    .area   _INITIALIZED
    .area   _BSEG
    .area _BSS
    .area _STACK
    .area _HEAP
    .area _CODE


    .globl init

init:

    ;; Initialise global variables
    call  gsinit
    call  _main

    ;call  gsexit
    ; use call LOOP instead of ret, works also
    ; with direct load+start on simulator
    call #0xF003
    .db #0x12

    .area   _GSINIT
gsinit::
    ; copy initialized variables to 'RAM'
    ld  bc, #l__INITIALIZER
    ld  a, b
    or  a, c
    jr  Z, gsinit_zero
    ld  de, #s__INITIALIZED
    ld  hl, #s__INITIALIZER
    ldir

gsinit_zero:
    ; did we have data to zero?
    ld  bc, #l__DATA
    ld  a, b
    or  a, c
    ;jr Z, gsinit_next
    ret Z

    ; zero uninitialized stuff
    xor     a              ; clear a and carry
    ld      bc, #l__DATA   ; ram size left
    ld      hl, #s__DATA
    ld      de, #s__DATA+1
    ld      ( hl), a
    ldir

gsinit_next:

    .area   _GSFINAL
    ret

    .area   _GSEXIT
gsexit::

    .area   _GSEXITFINAL
    ;ret


  .area   _STACK
  ; stack is usally located at 0x01c4

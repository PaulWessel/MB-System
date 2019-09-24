///
/// @file mconfig.h
/// @authors k. headley
/// @date 06 nov 2012
 
/// Library configuration
/// set debug parameters for modules in this project
 
/// @sa doxygen-examples.c for more examples of Doxygen markup
 

/////////////////////////
// Terms of use 
/////////////////////////
/*
 Copyright Information
 
 Copyright 2000-2018 MBARI
 Monterey Bay Aquarium Research Institute, all rights reserved.
 
 Terms of Use
 
 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 3 of the License, or
 (at your option) any later version. You can access the GPLv3 license at
 http://www.gnu.org/licenses/gpl-3.0.html
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details 
 (http://www.gnu.org/licenses/gpl-3.0.html)
 
 MBARI provides the documentation and software code "as is", with no warranty,
 express or implied, as to the software, title, non-infringement of third party 
 rights, merchantability, or fitness for any particular purpose, the accuracy of
 the code, or the performance or results which you may obtain from its use. You 
 assume the entire risk associated with use of the code, and you agree to be 
 responsible for the entire cost of repair or servicing of the program with 
 which you are using the code.
 
 In no event shall MBARI be liable for any damages, whether general, special,
 incidental or consequential damages, arising out of your use of the software, 
 including, but not limited to, the loss or corruption of your data or damages 
 of any kind resulting from use of the software, any prohibited use, or your 
 inability to use the software. You agree to defend, indemnify and hold harmless
 MBARI and its officers, directors, and employees against any claim, loss, 
 liability or expense, including attorneys' fees, resulting from loss of or 
 damage to property or the injury to or death of any person arising out of the 
 use of the software.
 
 The MBARI software is provided without obligation on the part of the 
 Monterey Bay Aquarium Research Institute to assist in its use, correction, 
 modification, or enhancement.
 
 MBARI assumes no responsibility or liability for any third party and/or 
 commercial software required for the database or applications. Licensee agrees 
 to obtain and maintain valid licenses for any additional third party software 
 required.
 */

// include guard
#ifndef MCONFIG_H
/// @def MCONFIG_H
/// @brief include guard
#define MCONFIG_H

/////////////////////////
// Includes 
/////////////////////////

#include "mframe.h"

// User Includes...

/////////////////////////
// Type Definitions
/////////////////////////



/////////////////////////
// Macros
/////////////////////////

/// @def MTIME_STOPWATCH_EN
/// @brief enable stopwatch macros
//#ifndef MTIME_STOPWATCH_EN
//#define MTIME_STOPWATCH_EN
//#endif

/// @def MST_STATS_EN
/// @brief enable stats macros
//#ifndef MST_STATS_EN
//#define MST_STATS_EN
//#endif

/////////////////////////
// Exports
/////////////////////////

#ifdef __cplusplus
extern "C" {
#endif

// exported config functions here

/// @fn int mconf_init(void *pargs, void *prtn)
/// @brief app-specific init (user defined in mconfig.c)
/// @param[in]  pargs arguments
/// @param[out] prtn  return value
/// @return 0 on success, -1 otherwise
int mconf_init(void *pargs, void *prtn);

#ifdef __cplusplus
}
#endif

// include guard
#endif

/*
 * Copyright (c) 2021-2022 International Innovation Center of Tsinghua University, Shanghai
 * Ventus is licensed under Mulan PSL v2.
 * You can use this software according to the terms and conditions of the Mulan PSL v2.
 * You may obtain a copy of Mulan PSL v2 at:
 *          http://license.coscl.org.cn/MulanPSL2
 * THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
 * EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
 * MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
 * See the Mulan PSL v2 for more details. */

package Pipeline

import DefineSim.SpinalSim.PrefixComponent
import spinal.core._
import spinal.lib._

/*
* as the ventus-doc, each warp store it's pc
* when they are sent to the i-cache, the pc value will plus 4
* if has branch will jump to the target position */

class PCControl() extends PrefixComponent{

  val io = new Bundle{
    val New_PC = in UInt(32 bits)


  }


}

// ============================================================================
// Amazon FPGA Hardware Development Kit
//
// Copyright 2025 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Amazon Software License (the "License"). You may not use
// this file except in compliance with the License. A copy of the License is
// located at
//
//    http://aws.amazon.com/asl/
//
// or in the "license" file accompanying this file. This file is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or
// implied. See the License for the specific language governing permissions and
// limitations under the License.
// ============================================================================

//------------------------------------------------------------------------------
// GENERATED FILE. DO NOT MODIFY!
//------------------------------------------------------------------------------
   input                 CLK_DIMM_DP,
   input                 CLK_DIMM_DN,
   output                M_ACT_N,
   output       [17:0]   M_MA,
   output       [1:0]    M_BA,
   output       [1:0]    M_BG,
   output       [1:0]    M_CKE,
   output       [1:0]    M_ODT,
   output       [1:0]    M_CS_N,
   output       [1:0]    M_CLK_DN,
   output       [1:0]    M_CLK_DP,
   output                M_PAR,
   inout        [63:0]   M_DQ,
   inout        [7:0]    M_ECC,
   inout        [17:0]   M_DQS_DP,
   inout        [17:0]   M_DQS_DN,
   output                RST_DIMM_N,
   input                 PCIE_EP_PERSTN,
   input                 PCIE_EP_REF_CLK_P,
   input                 PCIE_EP_REF_CLK_N,
   output       [7:0]    PCIE_EP_TXP,
   output       [7:0]    PCIE_EP_TXN,
   input        [7:0]    PCIE_EP_RXP,
   input        [7:0]    PCIE_EP_RXN,
   output                PCIE_RP_PERSTN,
   input                 PCIE_RP_REF_CLK_P,
   input                 PCIE_RP_REF_CLK_N,
   output       [7:0]    PCIE_RP_TXP,
   output       [7:0]    PCIE_RP_TXN,
   input        [7:0]    PCIE_RP_RXP,
   input        [7:0]    PCIE_RP_RXN

function Tphi = pitchController(phi,phiDesired,dphi_dt)
kd_phi = 5;
kp_phi = 10;
Tphi= kp_phi*(phiDesired-phi) + kd_phi*(0-dphi_dt);
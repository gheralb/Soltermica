within Soltermica.ThermoFluidSystems.Boilers.Catalogue;

record BAXI_PLATINIUM_24_24F=
  Soltermica.ThermoFluidSystems.Boilers.Catalogue.TechnicalSpecifications(
    V_cald=0.008+0.002,
    V_flow_nom=0.0002,
    dp_nom=1000,
    CapacidadTermicaVacio=42*150,
    RendimientoInstantaneo=0.92,
    V_flow_min=2/(60*1000),
    ModulacionMinima=(4100/24000),
    PotenciaNominal=24000,
    PCCombustible=(44000+39900)/2,
    S_cald=(0.345*0.763)*2+(0.345*0.450)*2+(0.450*0.763)*1);
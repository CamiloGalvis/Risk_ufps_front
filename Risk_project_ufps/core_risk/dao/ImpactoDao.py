from Risk_project_ufps.core_risk.dto.models import Impacto


class ImpactoDao:

    def listar_impactos_by_proyecto(self, proyecto):
        impactos = {}
        try:
            impactos = Impacto.objects.filter(proyecto=proyecto).order_by('impacto_valor')
        except Exception as e:
            raise e
        finally:
            return impactos

    def crear_impacto(self, impacto_categoria, impacto_valor, proyecto):
        impacto = None
        try:
            impacto = Impacto.objects.create(
                impacto_categoria=impacto_categoria,
                impacto_valor=impacto_valor,
                proyecto=proyecto
            )
        except Exception as e:
            raise e
        finally:
            return impacto

    def actualizar_impacto(self, impacto, impacto_categoria, impacto_valor):
        try:
            impacto.impacto_categoria = impacto_categoria
            impacto.impacto_valor = impacto_valor
            impacto.save()
        except Exception as e:
            raise e
        finally:
            return impacto

    def eliminar_impactos_by_proyecto(self, proyecto):
        result = None
        try:
            result = Impacto.objects.filter(proyecto=proyecto).delete()
        except Exception as e:
            print(e)
        finally:
            return result
